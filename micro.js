define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");

	var Model = function() {
		this.callParent();
	};
	
	//图片路径转换
/*	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};*/
	
	//获取一级分类信息
	/*
	1、默认显示当前一级菜单对应的二、三级数据
	2、点击其它一级菜单，再加载它的二三级数据
	*/
	//Model.prototype.rootClassDataCustomRefresh = function(event){		
		/*
		1、加载一级分类数据
		 */
//		var dataR = this.comp("rootClassData");
//		justep.Baas.sendRequest({
//			"url" : "/eeda/shop",
//			"action" : "queryCategory",
//			"async" : false,
//			"params" :  {"level":"1"},
//			"success" : function(data) {
//				dataR.loadData(data);
//			}
//		});
	//}


	
//	Model.prototype.li1Click = function(event){
//		var row = event.bindingContext.$object;
//		this.loadLvl1Data(row.val('id'));
//	};


//	Model.prototype.baasCategoryDataLevel0AfterRefresh = function(event){
//		var lvl0_data = this.comp("baasCategoryDataLevel0");
//		var rootRowId = lvl0_data.getCurrentRowID();
//		this.loadLvl1Data(rootRowId);
//		
//		//this.comps("secondClassList")
//	};
	
	

	/*//商品点击事件
	 1、获取当前商品ID
	 2、传入弹出窗口，弹出窗口中显示商品详细信息
	 3、在弹出窗口的接收事件中，从服务端过滤数据
	 */
	//Model.prototype.li3Click = function(event){
//		var row = event.bindingContext.$object;
//		var category_name = row.val("name");
//		var category_id = row.val("id");
//		justep.Shell.showPage("list",{
//			keyValue : category_name,
//			category_id: category_id
//		});
	//};

	Model.prototype.分类表CustomRefresh = function(event){
		var dataR = this.comp("分类表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryTable",
			"async" : false,
			"params" :  {tableName:'分类表'},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};

	Model.prototype.listClick = function(event){
		var row = event.bindingContext.$object;
		var category_id = row.val("编号");
		var category_name = row.val("名称");
		justep.Shell.showPage("list", {
			"category_id" : category_id,
			"keyValue" : category_name
		});
	};

	Model.prototype.scrollView1PullDown = function(event){
		this.comp("分类表").refreshData();
	};

	return Model;
});