define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");

	var Model = function() {
		this.callParent();
	};
	
	//图片路径转换
	Model.prototype.getImageUrl = function(url){
		return require.toUrl(url);
	};
	
	//获取一级分类信息
	/*
	1、默认显示当前一级菜单对应的二、三级数据
	2、点击其它一级菜单，再加载它的二三级数据
	*/
	Model.prototype.rootClassDataCustomRefresh = function(event){		
		/*
		1、加载一级分类数据
		 */
//		var url = require.toUrl("./category/json/rootClassData.json");
//		allData.loadDataFromFile(url,event.source,true);       
	};
	//获取二级分类信息	
	Model.prototype.secondClassDataCustomRefresh = function(event){
		/*
		1、加载二级分类数据
		 */
//		var url = require.toUrl("./category/json/secondClassData.json");
//		allData.loadDataFromFile(url,event.source,true);
	};
	//获取三级分类信息
	Model.prototype.threeClassDataCustomRefresh = function(event){
		/*
		1、加载三级分类数据
		 */
//		var url = require.toUrl("./category/json/threeClassData.json");
//		allData.loadDataFromFile(url,event.source,true);
	};

	Model.prototype.li1Click = function(event){
		var row = event.bindingContext.$object;
		console.log(row.val('id'));
		this.loadLvl1Data(row.val('id'));
	};


	Model.prototype.baasCategoryDataLevel0AfterRefresh = function(event){
		var lvl0_data = this.comp("baasCategoryDataLevel0");
		var rootRowId = lvl0_data.getCurrentRowID();
		this.loadLvl1Data(rootRowId);
		
		//this.comps("secondClassList")
	};
	
	Model.prototype.loadLvl1Data = function(rootId) {
		var lvl1_data = this.comp("baasCategoryDataLevel1");
		lvl1_data.setFilter("filter0", "parent_id = "+rootId);
		lvl1_data.refreshData();//记得检查组件是否绑定了col'name'去显示
		//console.log('lvl1_data.count()='+lvl1_data.count());
		if(lvl1_data.count() === 0){//卫语句
			return;
		}
			
		var lvl1_ids='';
		lvl1_data.each(function(obj){
			lvl1_ids += ", "+obj.row.val('id');+"";
		});
		var lvl2_data = this.comp("baasCategoryDataLevel2");
		lvl2_data.setFilter("filter0", "parent_id in ("+lvl1_ids.substr(1)+")");
		lvl2_data.refreshData();//记得检查组件是否绑定了col'name'去显示
		//console.log('lvl2_data.count()='+lvl2_data.count());
	};

	/*//商品点击事件
	 1、获取当前商品ID
	 2、传入弹出窗口，弹出窗口中显示商品详细信息
	 3、在弹出窗口的接收事件中，从服务端过滤数据
	 */
	Model.prototype.li3Click = function(event){
		var row = event.bindingContext.$object;
		var category_name = row.val("name");
		//console.log('商品类别='+category_name);
		justep.Shell.showPage("list",{
			keyValue : category_name
		});
	};

	return Model;
});