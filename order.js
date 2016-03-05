define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");
	
	var Model = function(){
		this.callParent();
	};
		
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
		
	//获取商品列表
	Model.prototype.goodsDataCustomRefresh = function(event){
		/*
		1、加载商品数据
		 */
//		var url = require.toUrl("./cart/json/goodsData.json");
//		allData.loadDataFromFile(url,event.source,true);
		var goodsData = this.comp("goodsData");
		var data =  JSON.parse(localStorage.getItem("cart_submit_goods"));
		goodsData.loadData(data);
		goodsData.each(function(obj){
			console.log(obj.row.val('id')+", fNumber: " + obj.row.val('fNumber') );
		});    
	};
	//获取店铺信息
	Model.prototype.shopDataCustomRefresh = function(event){
		/*
		1、从localStorage 加载itemId, 查出店铺数据
		 */
//		var url = require.toUrl("./cart/json/shopData.json");
//		allData.loadDataFromFile(url,event.source,true);
		var shopData = this.comp("shopData");
		var data =  JSON.parse(localStorage.getItem("cart_submit_shop"));
		shopData.loadData(data);
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
		/*
		1、确认按钮点击事件
			跳出支付方式，选择dialog: 微信，支付宝，信用卡，到付
		    TODO 后台生成订单记录，购物车清除已购买的记录
		2、打开成功页面
		*/
		
		
		
		justep.Shell.showPage("success");
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
		var title=row.val("fSendName")+" "+row.val("fCost");		
		$("span[xid=sendTitle]", this.getRootNode()).text(title);
		this.comp("popOver").hide();
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
	
	Model.prototype.payMethodClick = function(event){
		this.comp("popOverPay").show();
	};
	
	Model.prototype.payRadioClick = function(event){
		this.comp("popOverPay").hide();
	};
	
	return Model;
});