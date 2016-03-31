define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");

	var Model = function() {
		this.callParent();
		this.isBack;	
	};
	
	//返回上一页
	Model.prototype.backBtnClick = function(event){
		justep.Shell.closePage();
		setTimeout(function(){
			justep.Shell.fireEvent("onRestoreContent", {});
		},500);
	};
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};

	//获取商品列表
	Model.prototype.购物车商品表DataCustomRefresh = function(event){
		/*
		1、加载商品数据
		 */
//		var url = require.toUrl("./cart/json/goodsData.json");
//		allData.loadDataFromFile(url,event.source,true);        
		// 通过Baas获取数据
		var userId = localStorage.getItem("userID");
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {tableName:'购物车商品表',templateName:'f20',value:userId},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};
	//获取店铺信息
	Model.prototype.商店表CustomRefresh = function(event){
		/*
		1、加载店铺数据
		 */
		//var url = require.toUrl("./cart/json/shopData.json");
		//allData.loadDataFromFile(url,event.source,true);
		var userId = localStorage.getItem("userID");
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryInterface",
			"async" : false,
			"params" : {
			tableName:"购物车商品表",
			functionName:"购物车商店接口(value)",
			value:userId
			},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
		
	};
	//全选
	Model.prototype.allChooseChange = function(event){
		/*
		1、全选多选框绑定变化事件onChange()
		2、点击全选多选框按钮，获取其值
		3、修改商品表中的fChoose字段为全选多选框按钮的值
		*/
		var goodsData = this.comp("购物车商品表");
		var choose=this.comp("allChoose").val();
		goodsData.each(function(obj){
			if(choose){				
				goodsData.setValue("是否选中","1",obj.row);
			} else {
				goodsData.setValue("是否选中","0",obj.row);
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
		var row = event.bindingContext.$object;
		var n=row.val("数量");
		if(n>1){
			row.val("数量",n-1);
			
			justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "updateOrder",
			"async" : false,
			"params" : {
				'tableName':'购物车商品表',
				'objectId':row.val('objectId'),
				'templateName':'数量',
				'value' : n-1},
			"success" : function(data) {
				if(data.result=='sussess')
					justep.Util.hint("数量-1");
				else{
					row.val("数量",n);
					justep.Util.hint("-1失败", {
						"type" : "danger"
					});
					}
				}
			});
		}
	};
	
	//加数量
	Model.prototype.addBtnClick = function(event){
		/*
		1、增加数量按钮绑定点击事件onClick()
		2、点击按钮，当前记录的fNumber值加1
		*/
		var row = event.bindingContext.$object;
		var n=row.val("数量");
		row.val("数量",n+1);
		
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "updateOrder",
			"async" : false,
			"params" : {
				'tableName':'购物车商品表',
				'objectId':row.val('objectId'),
				'templateName':'数量',
				'value' : n+1},
			"success" : function(data) {
				if(data.result=='sussess')
					justep.Util.hint("数量+1");
				else{
					row.val("数量",n);
					justep.Util.hint("+1失败", {
						"type" : "danger"
					});
				}
					
			}
		});
	};
	
	//删除
	Model.prototype.delBtnClick = function(event){
		/*
		1、删除按钮点击事件
		2、删除选中商品
		3、如果商店里已经没有商品，则删除商店
		*/
//		var goodsData = this.comp("购物车商品表");
//		var goodsRows = goodsData.find(["是否选中"],["1"]);
//		goodsData.deleteData(goodsRows);
//  
//		var shopData = this.comp("商店表");
//		var shopRows = new Array();
//		shopData.each(function(obj){
//			var n = goodsData.find(["商店编号"],[obj.row.val("id")]).length; 
//			if(n == 0){
//				shopRows.push(obj.row);
//			}
//		});    
//		shopData.deleteData(shopRows);  
		var data = this.comp('购物车商品表');
        var cardIDs = '';
        var cardObjectIDs = '';
        data.each(function(obj){	
        	if(data.val('是否选中',obj.row)==1){
        		cardIDs += data.val("编号",obj.row)+',';
        		cardObjectIDs += data.val("objectId",obj.row)+',';
        	}		
		});
		
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "deleteOrder",
			"async" : false,
			"params" : {'tableName':'购物车商品表','value' : cardObjectIDs.substring(0,cardObjectIDs.length-1)},
			"success" : function(data) {
				if(data.result=='sussess')
					justep.Util.hint("删除成功");
				else
					justep.Util.hint("删除失败 ", {
						"type" : "danger"
					});
			}
		});
		this.comp("商店表").refreshData();
		this.comp("购物车商品表").refreshData();
	};
	
	Model.prototype.showBackBtn = function(isBack){
		/*
		1、根据参数修改calculateData
		 */		
		this.isBack = isBack;
		var v = isBack ? 1 : 0;
		this.comp("calculateData").setValue("isBack",v);		
	};
	
	//结算事件
	Model.prototype.settlementClick = function(event){
		/*
		1、结算按钮点击事件
		2、打开订单确认页面
		3、点击确认按钮，选择支付方式
		4、进入支付成功页面
		*/		
        var data = this.comp('购物车商品表');
        var cardIDs = '';
        var cardObjectIDs = '';
        data.each(function(obj){	
        	if(data.val('是否选中',obj.row)==1){
        		cardIDs += data.val("编号",obj.row)+',';
        		cardObjectIDs += data.val("objectId",obj.row)+',';
        	}		
		});
		justep.Shell.showPage("order", {
			"cardIDs" : cardIDs.substring(0,cardIDs.length-1),
			"cardObjectIDs" : cardObjectIDs.substring(0,cardObjectIDs.length-1)
		});
	};

	Model.prototype.listClick = function(event){
		/*
		 1、获取当前商品ID
		 2、传入弹出窗口，弹出窗口中显示商品详细信息
		 3、在弹出窗口的接收事件中，从服务端过滤数据
		*/
		var row = event.bindingContext.$object;
		justep.Shell.showPage("detail", {
			goodsID : row.val("商品编号"),
			shopID : row.val("商店编号")
		});
	};


	Model.prototype.scrollViewPullDown = function(event){
		this.comp("购物车商品表").refreshData();
		this.comp("商店表").refreshData();
	};


	return Model;
});