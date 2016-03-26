define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");	
	var allData = require("./js/loadData");	
	require("cordova!org.apache.cordova.device");
	require("cordova!com.justep.cordova.plugin.weixin.v3");
	var buttom = "";
	
	var Model = function() {
		this.callParent();
		this.goodsID="";
		this.shopID="";
	};
	
	//返回上一页
	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
	};
	
	//接收
	Model.prototype.modelParamsReceive = function(event){
		/*
		1、参数接收事件
		2、根据参数从服务端过滤数据
		*/
		if (this.params.goodsID) {
			this.shopID = this.params.shopID;
			this.goodsID = this.params.goodsID;	
		}
	};	
	
	//获取轮换图片
	Model.prototype.imgDataCustomRefresh = function(event){
		/*
		1、加载轮换图片数据
		2、根据goodsID过滤数据
		3、修改对应图片的src
		*/		
//		var url = require.toUrl("./detail/json/imgData.json");
//		allData.loadDataFromFile(url,event.source,true);
		var carouselData= this.comp("商品轮播图片表");
		if (this.params.goodsID) {
			//this.shopID = this.params.shopID;
			this.goodsID = this.params.goodsID;
			
			//加载model数据
			justep.Baas.sendRequest({
				"url" : "/eeda/shop",
				"action" : "queryByValue",
				"async" : false,
				"params" : {'tableName':'商品轮播图片表','templateName':'f1','value' : this.params.goodsID},
				"success" : function(data) {
					carouselData.loadData(data);
				}
			});
		}

//		var baasData = event.source;
//		var me = this;
//		var carousel = this.comp("imgData");
//		baasData.each(function(obj) {
//			var fImg = require.toUrl(obj.row.val("fImg"));
//			debugger;
//			
//			if (me.comp('contents1').getLength() > obj.index) {
//				$(carousel.domNode).find("img").eq(obj.index).attr({
//					"src" : fImg
//				});
//				if (obj.index == 0) {
//					localStorage.setItem("index_BannerImg_src", fImg);
//				}
//			} else {
//				carousel.add('<img src="' + fImgUrl + '" class="tb-img1" bind-click="openPageClick" pagename="' + fUrl + '"/>');
//			}
//		});
	};
	

	
	//获取评论信息
	Model.prototype.commentsDataCustomRefresh = function(event){
		/*
		1、加载评论数据
		2、根据goodsID过滤数据
		 */
		var url = require.toUrl("./detail/json/commentsData.json");
        allData.loadDataFromFile(url,event.source,true);
	};
	
	//更多评论按钮
	Model.prototype.moreBtnClick = function(event){
		/*
		1、获取当前商品ID
		2、传入新窗口，打开的窗口中显示评论列表
		3、在打开的窗口中接收数据，并从服务端过滤数据		
		*/
	};
	
	//购物车按钮
	Model.prototype.shoppingCartBtnClick = function(event){
		/*
		1、切换到购物车页面
		*/
		justep.Shell.fireEvent("onShoppingContent",{});
		justep.Shell.showMainPage();
	};
	//加入购物车
	Model.prototype.joinCartBtnClick = function(event){
		/*
		1、弹出商品尺码颜色选择框
		2、点击确定后购物车中增加一条相应数据
		*/
		buttom = 'addCard';
		this.comp("stateData").setValue("state",0);
		this.comp("popOver").show();
	};
	
	//购买按钮
	Model.prototype.buyBtnClick = function(event){
		/*
		1、获取当前商品ID
		2、传入新窗口，打开的窗口中显示购买确认页面
		3、在打开的窗口中接收数据，并从服务端过滤数据
		*/
		buttom = 'buy';
		this.comp("stateData").setValue("state","0");
		this.comp("popOver").show();
	};
	
	//查看宝贝分类按钮
	Model.prototype.classBtnClick = function(event){
		/*
		1、获取当前商铺ID
		2、传入新窗口，打开的窗口中显示商铺分类
		3、在打开的窗口中接收数据，并从服务端过滤数据
		*/
	};
	
	//进店逛逛按钮
	Model.prototype.storeBtnClick = function(event){
		/*
		1、获取当前商铺ID
		2、传入新窗口，打开的窗口中显示店铺主页面
		3、在打开的窗口中接收数据，并从服务端过滤数据
		*/
	};
	
	//全部宝贝按钮
	Model.prototype.goodsBtnClick = function(event){
		/*
		1、获取当前店铺ID
		2、传入新窗口，打开的窗口中显示商品列表
		3、在打开的窗口中接收数据，并从服务端过滤数据
		*/
	};
	
	//分享按钮
	Model.prototype.shareBtnClick = function(event){
		/*
		1、获取商品ID 
		2、打开分享页面
        3、参数说明 
            thumb：缩略图，可以显示商品图片，注意不能大于32kb，链接从http开始
			webpageUrl: 分享链接，使用location.href显示当前页面，链接从http开始
			scene:分享到微信朋友圈、微信朋友、微信群 
				weixin.Scene.TIMELINE 是分享到微信朋友圈
		 		weixin.Scene.SESSION 是分享给微信朋友、微信群
		*/
		if (!navigator.weixin) {
			return;
		}
		var weixin = navigator.weixin;
		var Utils = require("$UI/system/components/justep/common/utils");		
		weixin.share({
			message : {
				title : this.comp("goodsData").val("fTitle"),
				description : "",
				mediaTagName : "",
				thumb : location.origin + require.toUrl("./detail/img/icon.png"),
				media : {
					type : weixin.Type.WEBPAGE,
					webpageUrl : Utils.getShareUrl()
				}
			},
			scene : weixin.Scene.TIMELINE
		}, function() {
			// alert("Success");
		}, function(reason) {
			// alert("Failed: " + reason);
		});
			
	};
	
	//颜色选择弹出窗显示
	Model.prototype.popOverClick = function(event){		
		this.comp("stateData").setValue("state", 1);
		this.comp("popOver").show();
	};
	
	//颜色状态修改
	Model.prototype.colorLiClick = function(event){
		/*
		1、颜色选择点击事件
		2、修改当前颜色状态
		*/
		var colorData=this.comp("商品规格表");
		var row=colorData.getCurrentRow();		
		colorData.setValue("选中状态", "0", colorData.find(["选中状态"],["1"],true,true,true)[0]);
		colorData.setValue("选中状态", "1",row);
	};	

	Model.prototype.menuCartBtnClick = function(event){
		/*
		1、切换到购物车页面
		*/
		justep.Shell.fireEvent("onShoppingContent",{});
		justep.Shell.showMainPage();
	};	

	
	Model.prototype.商品表CustomRefresh = function(event){
		//加载model数据
		var goodsdata= this.comp("商品表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {'tableName':'商品表','templateName':'f1','value' : this.params.goodsID},
			"success" : function(data) {
				goodsdata.loadData(data);
			}
		});
	};	

	
	Model.prototype.图文详情表CustomRefresh = function(event){
		//加载model数据
		var Rdata= this.comp("图文详情表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {'tableName':'图文详情表','templateName':'f2','value' : this.params.goodsID},
			"success" : function(data) {
				Rdata.loadData(data);
			}
		});
	};	

	
	Model.prototype.详情参数表CustomRefresh = function(event){
		//加载model数据
		var Rdata= this.comp("详情参数表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {'tableName':'详情参数表','templateName':'f2','value' : this.params.goodsID},
			"success" : function(data) {
				Rdata.loadData(data);
			}
		});
	};	

	
	Model.prototype.商店表CustomRefresh = function(event){
		//加载model数据
		var Rdata= this.comp("商店表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {'tableName':'商店表','templateName':'f7','value' : this.params.shopID},
			"success" : function(data) {
				Rdata.loadData(data);
			}
		});
	};	

	
	Model.prototype.商品规格表CustomRefresh = function(event){
		//加载model数据
		var Rdata= this.comp("商品规格表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {'tableName':'商品规格表','templateName':'f2','value' : this.params.goodsID},
			"success" : function(data) {
				Rdata.loadData(data);
			}
		});
	};	
	
	
	Model.prototype.addCardClick = function(event){
		var islogin=localStorage.getItem("userID")//判断用户是否登陆
		if(islogin===null){
			justep.Shell.showPage("login",{
				"pageName":"detail"
			});
			return false;
		}
		
		var pages = this.comp("popOver");
		var userId = localStorage.getItem("userID");
		var obj={};
		obj.用户编号 = userId;
		obj.规格 = this.comp("商品规格表").getCurrentRow().val("规格信息");
		obj.商品编号 = this.comp("商品表").getCurrentRow().val("编号");
		obj.商店编号 = this.comp("商品表").getCurrentRow().val("商店编号");
		obj.商店名称 = this.comp("商品表").getCurrentRow().val("商店名称");
		obj.标题 = this.comp("商品表").getCurrentRow().val("标题");
		obj.图片外链 = this.comp("商品表").getCurrentRow().val("图片外链");
		obj.现价 = this.comp("商品表").getCurrentRow().val("现价");
		obj.原价 = this.comp("商品表").getCurrentRow().val("原价");
		obj.是否选中 = 0;
		obj.数量 = this.comp('数量').val('数量');
		obj.总价 = this.comp('数量').val('数量')*(this.comp("商品表").getCurrentRow().val("现价"));
		
		// 通过Baas保存数据
		event.cancel = true;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "createOrder",
			"params" : {
				"tableName":"购物车商品表",
				"json" : JSON.stringify( obj) 
			},
			"success" : function(resultData) {
				if(resultData.id){
					pages.hide();
					justep.Util.hint("加入购物车成功")
				}
			}
		});
	}
		
		
		
	//下订单
	Model.prototype.addOrderClick = function(event){
		var self = this;
		var islogin=localStorage.getItem("userID")//判断用户是否登陆
		if(islogin===null){
			justep.Shell.showPage("login",{
				"pageName":"detail"
			});
			return false;
		}
		
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {'tableName':'收货地址表','templateName':'f2,f7','value' : islogin+',是'},
			"success" : function(data) {
				if(data.rows.length<=0){
					justep.Shell.showPage("addressInfo",{
						"pageName":"detail"
					});
					return false;
				}
				
				var pages = self.comp("popOver");
				var obj={};
				obj.规格 = self.comp("商品规格表").getCurrentRow().val("规格信息");
				obj.商品编号 = self.comp("商品表").getCurrentRow().val("编号");
				obj.商店编号 = self.comp("商品表").getCurrentRow().val("商店编号");
				obj.商店名称 = self.comp("商品表").getCurrentRow().val("商店名称");
				obj.标题 = self.comp("商品表").getCurrentRow().val("标题");
				obj.图片外链 = self.comp("商品表").getCurrentRow().val("图片外链");
				obj.现价 = self.comp("商品表").getCurrentRow().val("现价");
				obj.原价 = self.comp("商品表").getCurrentRow().val("原价");
				obj.是否选中 = 0;
				obj.数量 = self.comp('数量').val('数量');
				obj.总价 = self.comp('数量').val('数量')*(self.comp("商品表").getCurrentRow().val("现价"));
				
				// 通过Baas保存数据
				//event.cancel = true;
				justep.Baas.sendRequest({
					"url" : "/eeda/shop",
					"action" : "createOrder",
					"params" : {
						"tableName":"购物车商品表",
						"json" : JSON.stringify( obj) 
					},
					"success" : function(resultData) {
						justep.Shell.showPage("order", {
							cardObjectIDs : resultData.objectId,
							cardIDs : resultData.id,
							pageName : 'detail'
						});
					}
				});
			}	
		});
	};	
	
	
	//减数量
	Model.prototype.reductionBtnClick = function(event){		
		/*
		1、减少数量按钮绑定点击事件onClick()
		2、点击按钮，当前记录的fNumber值减1
		3、fNumber为1时不再相减
		*/
		var row = this.comp('数量');
		var n=row.val("数量");
		if(n>1){
			row.setValue("数量",n-1);
		}
	};
	
	//加数量
	
	Model.prototype.addBtnClick = function(event){
		/*
		1、增加数量按钮绑定点击事件onClick()
		2、点击按钮，当前记录的fNumber值加1
		*/
		var row = this.comp('数量');
		var n=row.val("数量");
		row.setValue("数量",n+1);
	};

	
	Model.prototype.confirmBtn = function(event){
		if(buttom =='addCard'){
			this.addCardClick(event);
		}else{
			this.addOrderClick(event);
		}
	};

	
	Model.prototype.scrollView1PullDown = function(event){
		this.comp("商品表").refreshData();
		this.comp("商店表").refreshData();
		this.comp("商品规格表").refreshData();
		this.comp("商品轮播图片表").refreshData();
	};

	
	return Model;
});