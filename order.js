define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = justep.Baas;
	var allData = require("./js/loadData");
	
	require("$UI/system/lib/cordova/cordova");
	require("cordova!org.apache.cordova.device");
	require("cordova!com.justep.cordova.plugin.weixin.v3");
	require("cordova!com.justep.cordova.plugin.alipay");
	require("cordova!org.apache.cordova.geolocation");
	require("cordova!com.justep.cordova.plugin.baidulocation");
	require("cordova!cn.jpush.phonegap.JPushPlugin");
	require("cordova!com.justep.cordova.plugin.unionpay");
	require("res!./img");
	
	
	var Model = function(event){
		this.callParent();
	};
	
	Model.prototype.modelLoad = function(event) {
	    debugger;
		var self = this;
		// 获取url上的code参数 - 微信授权code，用于获取微信用户信息
//		var weixinCode = this.getContext().getRequestParameter("code");
		var urlParam = new RegExp('[\\?&]code=([^&#]*)').exec(window.location.href);
		var weixinCode = urlParam[1] || '';

		// 判断运行环境是否在X5移动客户端中，如果在移动客户端中，则当deviceready后取手机设备uuid作为用户唯一标识
		if (justep.Browser.isX5App) {
			this._deviceType = "app";

			CommonUtils.attachDoubleClickExitApp(function() {
				if (self.comp('contents').getActiveIndex() === 0) {
					return true;
				}
				return false;
			});
			document.addEventListener("deviceready", function() {
				self._userID = window.device.uuid;
				self._userDefaultName = "新用户（来自X5APP的用户）";
			}, false);

		} else if (weixinCode !== "") {
			this._deviceType = "wx";
			if (justep.Browser.isWeChat) {
				this.wxApi = new navigator.WxApi("wx1a63f107b6b0815c");
			}
			
			//必须调用,否则后续报错  oauth2AccessToken 找不到 
			Baas.sendRequest({
				"url" : "/weixin/weixin",
				"action" : "userinfo",
				"async" : false,
				"params" : {
					code : weixinCode
				},
				"success" : function(weixinUser) {
					self._userID = weixinUser.openid;
					self._userDefaultName = weixinUser.nickname + "（来自微信的用户）";
					self._userDefaultAddress = weixinUser.country + weixinUser.province + weixinUser.city;
					self._userPhotoURL = weixinUser.headimgurl;
				}
			});
			
		}
		
//		this.comp('userData').filters.setVar("user", this._userID);
//		this.comp('orderData').filters.setVar("user", this._userID);
		
		//this.queryAddr();
	};
		
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
		


	//获取邮寄信息
	Model.prototype.sendDataCustomRefresh = function(event){
		/*
		1、加载邮寄数据
		 */
		var url = require.toUrl("./cart/json/sendData.json");
		allData.loadDataFromFile(url,event.source,true);
	};
	
	//打开成功页面
	Model.prototype.confirmBtnClick = function(event){
		this.comp('confirmBtn').set('disabled',true);
		/*
		0`生成订单
		1、确认按钮点击事件
			跳出支付方式，选择dialog: 微信，支付宝，信用卡，到付
		    TODO 后台生成订单记录，购物车清除已购买的记录
		2、打开成功页面
		*/
		var self = this;
		var orderID = justep.UUID.createUUID();
		var 送货方式 = this.comp("sendData").val("fSendName");
		var obj={};
		obj.商店编号 = this.comp("购物车商品表").getCurrentRow().val("商店编号");
		obj.商店名称 = this.comp("购物车商品表").getCurrentRow().val("商店名称");
		obj.商品编号 = this.comp("购物车商品表").getCurrentRow().val("商品编号");
		obj.标题 = this.comp("购物车商品表").getCurrentRow().val("标题");
		obj.图片外链 = this.comp("购物车商品表").getCurrentRow().val("图片外链");
		obj.现价 = this.comp("购物车商品表").getCurrentRow().val("现价");
		obj.原价 = this.comp("购物车商品表").getCurrentRow().val("原价");
		obj.规格 = this.comp("购物车商品表").getCurrentRow().val("规格");
		obj.数量 = this.comp("购物车商品表").getCurrentRow().val("数量");
		obj.配送时间 = this.comp("配送时间段配置表").getCurrentRow().val("配送时间");
		if(送货方式=='提货点取')
			obj.提货点 = this.comp("提货地点表").getCurrentRow().val("地址")+"，电话："+this.comp("提货地点表").getCurrentRow().val("联系电话");
		if(送货方式=='到店自取')
			obj.门店信息 = this.comp("门店信息表").getCurrentRow().val("地址")+"，电话："+this.comp("门店信息表").getCurrentRow().val("电话");
		obj.状态 = "未付款";
		if(送货方式=='特快')
			obj.总价 = this.comp("购物车商品表").getCurrentRow().val("数量")*this.comp("购物车商品表").getCurrentRow().val("现价")+20;
		obj.送货地址 = this.comp("收货地址表").getCurrentRow().val("地址")+"，姓名："+this.comp("收货地址表").getCurrentRow().val("姓名")+"，电话："+this.comp("收货地址表").getCurrentRow().val("电话");
		obj.配送方式 = 送货方式;
		obj.买家留言 = this.comp("input1").val();
		
		//通过Baas保存数据
		event.cancel = true;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "createOrder",
			"params" : {
				"tableName":"订单表",
				"json" : JSON.stringify(obj) 
			},
			"success" : function(resultData) {
				justep.Util.hint("下单成功，谢谢您的订餐！");
				debugger;
				
				justep.Baas.sendRequest({
					"url" : "/eeda/shop",
					"action" : "deleteOrder",
					"async" : false,
					"params" : {'tableName':'购物车商品表','value' : self.params.cardObjectIDs},
					"success" : function(data) {
					}
				});
				
				
				
				
				//userData.applyUpdates();
				// 开始支付
				var payDtd = self.payOrder(resultData.id);
				payDtd.always(function(code) {
					orderData.setValue("fPayState", code);
					orderData.saveData({"onSuccess" : function() {
							self.comp("contents").to("orderContent");
						}});
					self.sendOrderPushMessage();
				}).fail(function(code) {
					justep.Util.hint("支付遇到问题!");
				});
			}
		});
		
		
		
		
		
		//justep.Shell.showPage("success");
	};
	
	Model.prototype.sendClick = function(event){
		/*
		1、配送方式按钮点击事件
		2、显示配送列表
		 */
		this.comp("popOver").show();
	};
	
	Model.prototype.sendLiClick = function(event){
		/*
		1、配送列表点击事件
		2、选中配送方式，关闭配送列表
		*/
		this.comp("sendData").setValue("fState",0);
		var row = event.bindingContext.$object; 
		row.val("fState",1);
		if(row.val("fSendName")=='特快'){
			this.comp('购物车商品表').setValue("总价",(this.comp('购物车商品表').val('总价')+20));
		}else if(row.val("fSendName")=='快递'){
			this.comp('购物车商品表').setValue("总价",(this.comp('购物车商品表').val('总价')-20));
		}
		if(row.val("fSendName")=='提货点取'){
			$('#pickupDiv').show();
		}else {
			$('#pickupDiv').hide();
		}
		if(row.val("fSendName")=='到店自取'){
			$('#selfPickupDiv').show();
		}else{
			$('#selfPickupDiv').hide();
		}
		var title=row.val("fSendName")+" "+row.val("fCost");		
		$("span[xid=sendTitle]", this.getRootNode()).text(title);
		this.comp("popOver").hide();
	};
	
	Model.prototype.payMethodClick = function(event){
		this.comp("popOverPay").show();
	};
	
	Model.prototype.payMethodLiClick = function(event){
		/*
		1、配送列表点击事件
		2、选中配送方式，关闭配送列表
		*/
		this.comp("payMethodData").setValue("state",0);
		var row = event.bindingContext.$object; 
		row.val("state",1);
		var title=row.val("payMethodName");	
		$("span[xid=payTitle]", this.getRootNode()).text(title);
		this.comp("popOverPay").hide();
	};
	
	
	Model.prototype.deliveryTimeClick = function(event){
		this.comp("popDelivryTime").show();
	};
	Model.prototype.deliveryTimeLiClick = function(event){
		/*
		1、配送列表点击事件
		2、选中配送方式，关闭配送列表
		*/
		this.comp("配送时间段配置表").setValue("state",'否');
		var row = event.bindingContext.$object; 
		row.val("状态",'是');
		var title=row.val("配送时间");		
		$("span[xid=deliveryTitle]", this.getRootNode()).text(title);
		this.comp("popDelivryTime").hide();
	};
	
	
	Model.prototype.pickupClick = function(event){
		this.comp("popPickup").show();
	};
	Model.prototype.pickupLiClick = function(event){
		/*
		1、配送列表点击事件
		2、选中配送方式，关闭配送列表
		*/
		//this.comp("提货地点表").setValue("state",'否');
		var row = event.bindingContext.$object; 
		//row.val("状态",'是');
		var title=row.val("地址");		
		$("span[xid=pickupTitle]", this.getRootNode()).text(title);
		this.comp("popPickup").hide();
	};
	
	
	Model.prototype.selfPickupClick = function(event){
		this.comp("popSelfPickup").show();
	};
	Model.prototype.selfPickupLiClick = function(event){
		/*
		1、配送列表点击事件
		2、选中配送方式，关闭配送列表
		*/
		//this.comp("提货地点表").setValue("state",'否');
		var row = event.bindingContext.$object; 
		//row.val("状态",'是');
		var title=row.val("地址");		
		$("span[xid=selfPickupTitle]", this.getRootNode()).text(title);
		this.comp("popSelfPickup").hide();
	};
	
	/*Model.prototype.商店表CustomRefresh = function(event){
		var Rdata= this.comp("商店表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryShop",
			"async" : false,
			"params" : {'tableName':'商店表','templateName':'f7','value' : this.params.orderID},
			"success" : function(data) {
				Rdata.loadData(data);
			}
		});
	};*/
	
	Model.prototype.收货地址表CustomRefresh = function(event){
		var userID =localStorage.getItem("userID")
		var Rdata= this.comp("收货地址表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {'tableName':'收货地址表','templateName':'f2,f7','value' : userID+',是'},
			"success" : function(data) {
				Rdata.loadData(data);	
			}	
		});
	};
	
	Model.prototype.购物车商品表DataCustomRefresh = function(event){
		var Rdata= this.comp("购物车商品表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {'tableName':'购物车商品表','templateName':'f18','value' : this.params.cardIDs,'type':'in'},
			"success" : function(data) {
				Rdata.loadData(data);
			}
		});
	};
	
	
	
	
	
	
	
	
	
	/**
		支付失败参数:
			   <0 支付失败 按照不同支付类型 返回值不同
			   0 货到付款
		   1 用户采用微信支付付款完成
		   2 用户采用微信应用中js-sdk支付付款完成
		   3 用户采用支付宝支付付款完成
		   4 用户采用银联支付付款完成
		  ....未完待续 
	 **/
	Model.prototype.payOrder = function(orderID) {
	debugger;
		var payDtd = $.Deferred();
		var payType = this.comp('payMethodData').val('payMethodCode');
		if (payType === "faceToFace" || payType === "") {
			payDtd.resolve(0);
		} else if (payType === "weixin") {
			this.payOrderByWeixin(payDtd, orderID);
		} else if (payType == "alipay") {
			this.payOrderByAlipay(payDtd, orderID);
		} else if (payType == "weixinJSSDK") {
			this.payOrderByWeixinJSSDK(payDtd,orderID);
		} else if (payType == "union") {
			this.payOrderByUnion(payDtd,orderID);
		} else {
			payDtd.reject(0);
		}
		return payDtd.promise();
	};

	/**  
		-23 当前环境不支持微信支付
	  	-20 微信支付失败
	 */
	Model.prototype.payOrderByWeixinJSSDK = function(payDtd, orderID) {
		if (!navigator.WxApi) {
			payDtd.reject(-33);
			return;
		}
		var tradeNo = orderID;
		var notifyUrl = location.origin + "/baas/weixin/weixin/notify"
		debugger;
		this.wxApi.chooseWXPay({
			body : "x5外卖",
			mchId : "1228613502",
			notifyUrl : notifyUrl,
			outTradeNo : tradeNo,
			totalFee : "1"
		}).done(function() {
			payDtd.resolve(2);
		}).fail(function() {
			payDtd.reject(-20);
		});
	};

	/** 
	 * 9000 操作成功。 
	 * 4000 系统异常。 
	 * 4001 数据格式不正确。  
	 * 4003 该用户绑定的支付宝账户被冻结或不允许支付。 
	 * 4004  该用户已解除绑定。 
	 * 4005  绑定失败或没有绑定。 
	 * 4006  订单支付失败。 
	 * 4010  重新绑定账户。  
	 * 6000 支付服务正在进行升级操作。 
	 * 6001 用户中途取消支付操作。
	 * 
	    当请求支付已经到alipay应用但是失败 错误编码 以 -33 + message(message是非常大的整数一般都3000+)  
		-33 当前环境不支持支付宝支付
	  	-30 支付宝支付支付请求被拒绝
	 */
	Model.prototype.payOrderByAlipay = function(payDtd, orderID) {
		if (!navigator.alipay) {
			payDtd.reject(-33);
			return;
		}
		var notifyUrl = location.origin;
		var tradeNo = orderID;
		var alipay = navigator.alipay;
		alipay.pay({
			"seller" : "huangyx@justep.com", // 卖家支付宝账号或对应的支付宝唯一用户号
			"subject" : "x5外卖", // 商品名称
			"body" : "x5外卖", // 商品详情
			"price" : "0.01", // 金额，单位为RMB
			"tradeNo" : tradeNo, // 唯一订单号
			"timeout" : "30m", // 超时设置
			"notifyUrl" : notifyUrl
		}, // 服务器通知路径
		function(message) {
			var responseCode = parseInt(message);
			if (responseCode === 9000) {
				payDtd.resolve(3);
			} else if (!isNaN(responseCode)) {
				payDtd.reject((-33) + responseCode);
			} else {
				payDtd.reject(-30);
			}
		}, function(msg) {
			payDtd.reject(-30);
		});
	};
	/** 
	    当请求支付已经到weixin应用但是失败 错误编码 以 -13 + message(message如果为weixin异常一定为负数) 
		-13 当前环境不支持微信支付	
	  	-12 微信获取accessToken失败
	  	-11 微信生成预支付订单失败
	  	-10 微信支付请求被拒绝
	 */
	Model.prototype.payOrderByWeixin = function(payDtd, orderID) {
	alert("weixin:"+navigator.weixin);
//		if (!navigator.weixin) {
//			payDtd.reject(-13);
//			return;
//		}
		var notifyUrl = location.origin;
		var traceID = justep.UUID.createUUID();
		var traceNo = orderID;

		var weixin = navigator.weixin;
		weixin.generatePrepayId({
			"body" : "x5外卖",
			"feeType" : "1",
			"notifyUrl" : notifyUrl,
			"totalFee" : "1",
			"traceId" : traceID,
			"tradeNo" : traceNo
		}, function(prepayId) {
			weixin.sendPayReq(prepayId, function(message) {
				var responseCode = parseInt(message);
				if (responseCode === 0) {
					payDtd.resolve(1);
				} else if (!isNaN(responseCode)) {
					payDtd.reject((-13) + responseCode);
				} else {
					payDtd.reject(-10);
				}
			}, function(message) {
				justep.Util.hint("微信支付失败！");
				payDtd.reject(-10);
			});
		}, function(message) {
			justep.Util.hint("微信支付失败！");
			payDtd.reject(-11);
		});
	};
	/** 
	    当请求支付已经到unionpay但是失败
		-50 unionpay 失败
	 */
	Model.prototype.payOrderByUnion = function(payDtd,orderID) {
		Baas.sendRequest({
			"url" : "/unionpay/unionpay",
			"action" : "tn",
			"params" : {
				"orderId":orderID
			},
			"success" : function(data) {
				navigator.unionpay.pay({
					tn : data.tn
				}, function(code) {
					if(code === "success"){
						payDtd.resolve(4);
					}else{
						payDtd.reject(-50);
					}
					
				}, function(code) {
					payDtd.reject(-50);
				});
			},
			"error":function(){
				payDtd.reject(-50);
			}
		});
	};
	
	
	
	
	
	Model.prototype.配送时间段配置表CustomRefresh = function(event){
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryTable",
			"async" : false,
			"params" : {tableName:'配送时间段配置表'},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};
	
	
	
	
	
	Model.prototype.提货地点表CustomRefresh = function(event){
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryTable",
			"async" : false,
			"params" : {tableName:'提货地点表'},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};
	
	
	
	
	
	Model.prototype.门店信息表CustomRefresh = function(event){
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryTable",
			"async" : false,
			"params" : {tableName:'门店信息表'},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};
	
	
	
	
	
	return Model;
});