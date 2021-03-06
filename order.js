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
	
	//下订单
	Model.prototype.confirmBtnClick = function(event){
		this.comp('confirmBtn').set('disabled',true);
		var self = this;
		/*
		0`生成订单
		1、确认按钮点击事件
			跳出支付方式，选择dialog: 微信，支付宝，信用卡，到付
		    TODO 后台生成订单记录，购物车清除已购买的记录
		2、打开成功页面
		*/
		//通过店铺id计算生成订单的数量
		var cardData = self.comp("购物车商品表");
		var shopArray = [];
		var shopNameArray = [];
		cardData.each(function(obj){
			var shopId = cardData.val("商店编号",obj.row);
			var shopName = cardData.val("商店名称",obj.row);
			var check = false;
			for (var j = 0; j < shopArray.length; j++) {
				if(shopArray[j]==shopId)
					check = true;
			}
			if(!check){
				shopArray.push(shopId);
				shopNameArray.push(shopName);
			}
		});
		
		//主订单数据对象的构造
		var user = localStorage.getItem("userID");
		var 送货方式 = this.comp("sendData").val("fSendName");
		var orderObj={};
		orderObj.订单号 = new Date().getTime().toString();
		orderObj.配送时间 = this.comp("配送时间段配置表").getCurrentRow().val("配送时间");
		if(送货方式=='提货点取')
			orderObj.提货点 = this.comp("提货地点表").getCurrentRow().val("地址")+"，电话："+this.comp("提货地点表").getCurrentRow().val("联系电话");
		if(送货方式=='到店自取')
			orderObj.门店信息 = this.comp("门店信息表").getCurrentRow().val("地址")+"，电话："+this.comp("门店信息表").getCurrentRow().val("电话");
		orderObj.状态 = "未付款";
		orderObj.收货地址 = this.comp("收货地址表").getCurrentRow().val("地址")+"，姓名："+this.comp("收货地址表").getCurrentRow().val("姓名")+"，电话："+this.comp("收货地址表").getCurrentRow().val("电话");
		orderObj.配送方式 = 送货方式;
		orderObj.买家留言 = this.comp("input1").val();
		orderObj.用户编号 = user;

		
		//生成订单
		//先生成主订单表
		//再生成订单商品关系表
		for (var int = 0; int < shopNameArray.length; int++) {
			var total = 0;
			cardData.each(function(obj){
				if(shopNameArray[int]==cardData.val("商店名称",obj.row)){
					total += cardData.val("总价",obj.row);
				}
			});
			if(送货方式=='特快'){
				total+=20;
			}
			orderObj.总价 = total;
			orderObj.商店名称 = shopNameArray[int];
				
			//生成主单据
			createOrder(self,shopArray[int],orderObj,cardData);
		}
		
		//删除购物车
		deleteOrder(self);
	};
	
	var createOrder = function(self,shopId,orderObj,cardData){
		//通过Baas保存数据
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "createOrder",
			"params" : {
				"tableName":"订单表",
				"json" : JSON.stringify(orderObj) 
			},
			"success" : function(resultData) {
				if(!resultData.id)
					return;
					
				//订单商品表数据对象的构造
				var orderId = resultData.id;
				cardData.each(function(obj){
					var thisShopId = cardData.val("商店编号",obj.row);
					if(thisShopId == shopId){
						var orderGoodsObj = {};
						orderGoodsObj.订单编号 = orderId;
						orderGoodsObj.商店编号 = cardData.val("商店编号",obj.row);
						orderGoodsObj.商店名称 = cardData.val("商店名称",obj.row);
						orderGoodsObj.商品编号 = cardData.val("商品编号",obj.row);
						orderGoodsObj.商品名称 = cardData.val("标题",obj.row);
						orderGoodsObj.图片外链 = cardData.val("图片外链",obj.row);
						orderGoodsObj.现价 = cardData.val("现价",obj.row);
						orderGoodsObj.原价 = cardData.val("原价",obj.row);
						orderGoodsObj.规格 = cardData.val("规格",obj.row);
						orderGoodsObj.数量 = cardData.val("数量",obj.row);
						createOrder2(orderGoodsObj);
					}
				});
				
				//付款
				alert('开始支付');
				payMoney(self,resultData);
			}
		});
	};
	
	var createOrder2 = function(orderGoodsObj){
		//通过Baas保存数据
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "createOrder",
			"params" : {
				"tableName":"订单商品表",
				"json" : JSON.stringify(orderGoodsObj) 
			},
			"success" : function(resultData) {
				if(!resultData.id)
					return;
			}
		});
	};
	
	var deleteOrder = function(self){
		//删除购物车
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "deleteOrder",
			"async" : false,
			"params" : {'tableName':'购物车商品表','value' : self.params.cardObjectIDs},
			"success" : function(data) {
			}
		});
	};
	
	
	var payMoney = function(self,resultData){
		// 开始支付
		var payDtd = self.payOrder(resultData);
		payDtd.always(function(code) {
			orderData.setValue("fPayState", code);
			orderData.saveData({"onSuccess" : function() {
					self.comp("contents").to("orderContent");
				}});
			self.sendOrderPushMessage();
		}).fail(function(code) {
			justep.Util.hint("支付遇到问题!");
		});
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
	Model.prototype.payOrder = function(resultData) {
		var payDtd = $.Deferred();
		var payType = this.comp('payMethodData').val('payMethodCode');
		if (payType === "faceToFace" || payType === "") {
			payDtd.resolve(0);
		} else if (payType === "weixin") {
			this.payOrderByWeixin(payDtd, resultData);
		} else if (payType == "alipay") {
			this.payOrderByAlipay(payDtd, resultData);
		} else if (payType == "weixinJSSDK") {
			this.payOrderByWeixinJSSDK(payDtd,resultData);
		} else if (payType == "union") {
			this.payOrderByUnion(payDtd,resultData);
		} else {
			payDtd.reject(0);
		}
		return payDtd.promise();
	};

	/**  
		-23 当前环境不支持微信支付
	  	-20 微信支付失败
	 */
	Model.prototype.payOrderByWeixinJSSDK = function(payDtd, resultData) {
		if (!navigator.WxApi) {
			payDtd.reject(-33);
			return;
		}
		var tradeNo = resultData.订单号;
		var notifyUrl = location.origin + "/baas/weixin/weixin/notify";
		this.wxApi.chooseWXPay({
			body : "vshop order",
			mchId : "1312195301",
			notifyUrl : notifyUrl,
			outTradeNo : tradeNo,
			totalFee : resultData.total*100
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
	Model.prototype.payOrderByAlipay = function(payDtd, resultData) {
		alert('进入支付宝');
		if (!navigator.alipay) {
			payDtd.reject(-33);
			return;
		}
		var notifyUrl = location.origin;
		var tradeNo = resultData.订单号;
		var alipay = navigator.alipay;
		alipay.pay({
			"seller" : "zxmac@foxmail.com", // 卖家支付宝账号或对应的支付宝唯一用户号
			"subject" : "商品", // 商品名称
			"body" : "vshop sale", // 商品详情
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
	Model.prototype.payOrderByWeixin = function(payDtd, resultData) {
	alert("weixin:"+navigator.weixin);
//		if (!navigator.weixin) {
//			payDtd.reject(-13);
//			return;
//		}
		var notifyUrl = location.origin;
		var traceID = justep.UUID.createUUID();
		var traceNo = resultData.id;

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
	Model.prototype.payOrderByUnion = function(payDtd,resultData) {
		Baas.sendRequest({
			"url" : "/unionpay/unionpay",
			"action" : "tn",
			"params" : {
				"orderId":resultData.id
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
	
	
	
	Model.prototype.button4Click = function(event){
		justep.Shell.setIsSinglePage(true);
		justep.Shell.showPage("address",{
			"pageName":"order",
			"cardIDs":this.params.cardIDs
		});
	};
	
	
	
	
	return Model;
});