define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");
	var Baas = justep.Baas;

	var Model = function() {
		this.callParent();
		this.keyValue = "";
		this.category_id = "";
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};
	
	/*
		注意这里使用自定义SQL进行查询，设置filter是没有用的，需要设置参数var

		params中， SQL参数一定要带"var-"(后台代码会去掉这个前缀) 
		并且顺序要一一对应上
		Ray Liu
	 */
	Model.prototype.getGoodsByCategoryId = function(category_id) {
		var me = this;
		Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {'tableName':'商品表','templateName':'f12','value' : category_id},
			"success" : function(data) {
				me.comp("商品表").loadData(data);
			}
		});
	};

	Model.prototype.modelParamsReceive = function(event) {
		/*
		 * 1、接收上页传来参数、显示在搜索框中、参数不变不刷新
		 */
		 
		if (this.params != undefined) {
			if(this.params.category_id){//来自分类页
				this.category_id = this.params.category_id;
				this.comp("keyInput").val(this.params.keyValue);
				this.getGoodsByCategoryId(this.category_id);
			}else{//来自查询页
				if (this.keyValue != this.params.keyValue) {
					this.keyValue = this.params.keyValue;
					this.comp("keyInput").val(this.keyValue);
					this.comp("商品表").refreshData();
				}
			}
		}
	};

	// 获取商品列表
	Model.prototype.goodsDataCustomRefresh = function(event) {
		/*
		 * 1、加载商品数据 2、接收传入的参数，过滤数据
		 */
//		var url = require.toUrl("./list/json/goodsData.json");
//		allData.loadDataFromFile(url, event.source, true);
		if(!this.params.category_id){
			var Rdata= this.comp("商品表");
			justep.Baas.sendRequest({
				"url" : "/eeda/shop",
				"action" : "queryInterface",
				"async" : false,
				"params" : {'tableName':'商品表','functionName':'商品模糊查询表(value)','value' : this.params.keyValue},
				"success" : function(data) {
					Rdata.loadData(data);
				}
			});
		}
	};

	// 商品点击事件
	Model.prototype.listClick = function(event) {
		/*
		 * 1、获取当前商品ID 2、传入弹出窗口，弹出窗口中显示商品详细信息 3、在弹出窗口的接收事件中，从服务端过滤数据
		 */
		var data = this.comp("商品表");
		justep.Shell.showPage("detail", {
			goodsID : data.getValue("编号"),
			shopID : data.getValue("商店编号")
		});
	};

	// 搜索
	Model.prototype.searchBtnClick = function(event) {
		/*
		 * 1、进入搜索页面
		 */
		justep.Shell.showPage("search");
	};

	// 修改列表样式图标
	Model.prototype.listStyleClick = function(event) {
		/*
		 * 1、切换下一个页面
		 */
		this.comp('pages').next();
	};
	
	Model.prototype.pagesActiveChanged = function(event) {
		/*
		 * 1、页面变化完成事件 2、根据页面索引修改按钮图标
		 */
		var btnObj = this.comp("listStyleBtn");
		var index = this.comp("pages").getActiveIndex();
		if (index == "0") {
			btnObj.set("icon", "glyphicon glyphicon-th-list");
		} else {
			btnObj.set("icon", "glyphicon glyphicon-th-large");
		}
	};
	/* 选择排序按钮 */
	Model.prototype.sortingBtnClick = function(event) {

		if ($(this.comp("sortingPopOver").$domNode).css("display") == "block") {
			this.comp("sortingPopOver").hide();
		} else {
			this.comp("sortingPopOver").show();
		}

		if ($(this.comp("screeningPopOver").$domNode).css("display") == "block") {
			this.comp("screeningPopOver").hide();
		}
	};
	/* 选择排序 */
	Model.prototype.sortingListClick = function(event) {
		/*
		 * 1、排序点击事件 2、修改当前排序 3、关闭排序窗口
		 */
		var data = this.comp("conditionData");
		data.setValue("fState", "0", data.find([ "fState" ], [ "1" ], true, true, true)[0]);
		var row = data.getCurrentRow();
		data.setValue("fState", "1", row);
		this.comp("sortingBtn").set("label", data.getValue("fName", row));

		this.comp("sortingPopOver").hide();
	};

	/* 折扣和服务按钮 */
	Model.prototype.screeningBtnClick = function(event) {
		if ($(this.comp("screeningPopOver").$domNode).css("display") == "block") {
			this.comp("screeningPopOver").hide();
		} else {
			this.comp("screeningPopOver").show();
		}
		if ($(this.comp("sortingPopOver").$domNode).css("display") == "block") {
			this.comp("sortingPopOver").hide();
		}
	};

	/* 折扣和服务 */
	Model.prototype.discountClick = function(event) {
		/*
		 * 1、折扣和服务点击事件 2、选择折扣和服务，可多选
		 */
		var data = this.comp("discountData");
		var row = data.getCurrentRow();
		if (data.getValue("fState", row) == 0) {
			data.setValue("fState", "1", row);
		} else {
			data.setValue("fState", "0", row);
		}
	};

	/* 分类 */
	Model.prototype.classClick = function(event) {
		/*
		 * 1、分类点击事件 2、选择分类，单选
		 */
		var data = this.comp("classData");
		data.setValue("fState", "0", data.find([ "fState" ], [ "1" ], true, true, true)[0]);
		var row = data.getCurrentRow();
		data.setValue("fState", "1", row);
	};

	/* 重置 */
	Model.prototype.resetBtnClick = function(event) {
		/*
		 * 1、重置按钮点击事件 2、清空价格区间、折扣和服务、分类
		 */
		this.comp("price1").val("");
		this.comp("price2").val("");
		this.reset(this.comp("discountData"));
		this.reset(this.comp("classData"));
	};
	Model.prototype.reset = function(data) {
		var rows = data.find([ "fState" ], [ "1" ], false, true, true);
		for (var i = 0; i < rows.length; i++) {
			data.setValue("fState", "0", rows[i]);
		}
	};

	Model.prototype.modelLoad = function(event) {
		/*
		 * 判断html标签是否有iosstatusbar,有测表示在苹果手机上运行，顶部需要留出20px，因此修改popover的top
		 */
		var src = $("html").hasClass("iosstatusbar");
		if (src) {
			$(".x-popOver-overlay").css({
				"top" : "108px"
			});
		}
		/*
		 * 切换到缓存中保存的content
		 */
		var pagename = localStorage.getItem("list_style_name");
		if (pagename == null) {
			pagename = "oneColList";
		}
		this.comp("pages").to(pagename);
	};

	// 离开页面事件
	Model.prototype.modelUnLoad = function(event) {
		/*
		 * 将当前激活的content的Xid存入缓存
		 */
		localStorage.setItem("list_style_name", this.comp("pages").getActiveXid());
	};


//	Model.prototype.baasCategoryGoodsDataCustomRefresh = function(event){
//		console.log("baasCategoryGoodsDataCustomRefresh category_id="+this.params.category_id);
//		
//	};
	
	
	// 下划刷新
	Model.prototype.scrollViewPullDown = function(event) {
		/*
		 * 1、滚动视图下拉事件 2、刷新data
		 */
		this.modelParamsReceive();
	};


	Model.prototype.scrollView1PullDown = function(event){
		this.comp("商品表").refreshData();
	};


	return Model;
});