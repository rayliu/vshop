define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var allData = require("./js/loadData");
	var user = require("./user");
	var Model = function() {
		this.callParent();
		this.contentName;
		this.tag;
		this.lastContentXid = "homeContent";
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};
	

	Model.prototype.goodsDataCustomRefresh = function(event) {
		/*
		 * 1、加载商品数据
		 */
		var url = require.toUrl("./main/json/goodsData.json");
		allData.loadDataFromFile(url, event.source, true);
	};

	// 打开页面
	Model.prototype.openPageClick = function(event) {
		/*
		 * 1、点击组件增加算定义属性：pagename 2、获取自定义属性，打开 对应页面
		 */
		var pageName = event.currentTarget.getAttribute('pagename');
		if (pageName)
			justep.Shell.showPage(require.toUrl(pageName));
	};

	// 进入详细页
	Model.prototype.listClick = function(event) {
		/*
		 * 1、获取当前行 2、进入详细页面，并传值rowid
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

	// 下划刷新
	Model.prototype.scrollViewPullDown = function(event) {
		/*
		 * 1、滚动视图下拉事件 2、刷新data
		 */
		this.comp("轮播图片表").refreshData();
		this.comp("商品表").refreshData();
	};

	Model.prototype.shoppingContentInactive = function(event) {
		/*
		 * 1、购物车页面离开事件 2、获取子页面Model 3、调用子页面的函数showBackBtn，设置返回按钮显否显示
		 */
		var model = this.comp("navContainer4").getInnerModel();
		if (model) {
			model.showBackBtn(false);
		}
	};
	// 添加事件
	Model.prototype.modelLoad = function(event) {
		justep.Shell.on("onRestoreContent", this.onRestoreContent, this);
		justep.Shell.on("onShoppingContent", this.onShoppingContent, this);
		justep.Shell.on("onHomeContent", this.onHomeContent, this);
		
		
	};
	// 卸载事件
	Model.prototype.modelUnLoad = function(event) {
		justep.Shell.off("onRestoreContent", this.onRestoreContent);
		justep.Shell.off("onShoppingContent", this.onShoppingContent);
		justep.Shell.off("onHomeContent", this.onHomeContent);
	};
	// 返回上一次的content
	Model.prototype.onRestoreContent = function(event) {
		this.comp("contents2").to(this.lastContentXid);
	};
	// 记住当前content，切换到购物车页
	Model.prototype.onShoppingContent = function(event) {
		this.lastContentXid = this.comp("contents2").getActiveXid();
		this.comp("contents2").to("shoppingContent");
		var shoppingModel = this.comp("navContainer4").getInnerModel();
		if (shoppingModel) {
			shoppingModel.showBackBtn(true);
		}
	};
	// 切换到首页
	Model.prototype.onHomeContent = function(event) {
		this.comp("contents2").to("homeContent");
	};

	Model.prototype.contents2ActiveChange = function(event){
		var to = event.to;
		if (to >= 1) {
			// 优化内存占用
			$('.x-window-container', this.comp('content2').$domNode).css('display', 'none');
			this.comp('navContainer' + (to + 1)).$domNode.css('display', 'block');

			this.comp('navContainer' + (to + 1)).load();
		}

	};

/*	Model.prototype.baasImgDataAfterRefresh = function(event){
		
		 * 1、加载轮换图片数据
		 * 2、根据data数据动态添加carouse组件中的content页面 
		 * 3、如果img已经创建了，只修改属性
		 * 4、第一张图片信息存入localStorage
		 
		var baasData = event.source;
		var me = this;
		var carousel = this.comp("轮播图片表");
		baasData.each(function(obj) {
			var fImgUrl = require.toUrl(obj.row.val("图片外链"));
			var fUrl = require.toUrl(obj.row.val("图片超链接"));
			if (me.comp('contentsImg').getLength() > obj.index) {
				$(carousel.domNode).find("img").eq(obj.index).attr({
					"src" : fImgUrl,
					"pagename" : fUrl
				});
				if (obj.index == 0) {
					localStorage.setItem("index_BannerImg_src", fImgUrl);
					localStorage.setItem("index_BannerImg_url", fUrl);
				}
			} else {
				carousel.add('<img src="' + fImgUrl + '" class="tb-img1" bind-click="openPageClick" pagename="' + fUrl + '"/>');
			}
		});
	};*/

	Model.prototype.baasGoodsDataAfterRefresh = function(event){
		var baasData = event.source;
		console.log(baasData.count());
	};
	Model.prototype.modelParamsReceive = function(event){
		var status=event.params.status;
			if(status=="login"){
				this.comp("contents2").to("userContent");
				var divBtn=localStorage.getItem("userID")//隐藏与显示DIV
				if(divBtn===null){
					$("#divinfo").hide();
					$("#userDivBtn").show();
				}else{
					$("#divinfo").show();
					$("#userDivBtn").hide();
					$("#userInfo").text(localStorage.getItem("username"))//拿到用户名称回显	
		}
			}
	};
	
	Model.prototype.商品表CustomRefresh = function(event){
	    var dataR = this.comp("商品表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryTable",
			"async" : false,
			"params" : {tableName:"商品表"},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};
	
	Model.prototype.shoppingCartBtnClick = function(event){

	};
	
	
	/*Model.prototype.轮播图片表BeforeRefresh = function(event){
		var dataR = this.comp("轮播图片表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryCarousel",
			"async" : false,
			"params" :  {},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};*/
	
	
	Model.prototype.轮播图片表CustomRefresh = function(event){
		/*
		 * 1、加载轮换图片数据
		 * 2、根据data数据动态添加carouse组件中的content页面 
		 * 3、如果img已经创建了，只修改属性
		 * 4、第一张图片信息存入localStorage*/ 
		var dataR = this.comp("轮播图片表");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryTable",
			"async" : false,
			"params" :  {tableName:'轮播图片表'},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
		 
		 
		/*var baasData = event.source;
		var me = this;
		var carousel = this.comp("轮播图片表");
		baasData.each(function(obj) {
			var fImgUrl = require.toUrl(obj.row.val("图片外链"));
			var fUrl = require.toUrl(obj.row.val("图片超链接"));
			if (me.comp('contentsImg').getLength() > obj.index) {
				$(carousel.domNode).find("img").eq(obj.index).attr({
					"src" : fImgUrl,
					"pagename" : fUrl
				});
				if (obj.index == 0) {
					localStorage.setItem("index_BannerImg_src", fImgUrl);
					localStorage.setItem("index_BannerImg_url", fUrl);
				}
			} else {
				carousel.add('<img src="' + fImgUrl + '" class="tb-img1" bind-click="openPageClick" pagename="' + fUrl + '"/>');
			}
		});*/
	};
	
	Model.prototype.image8Click = function(event){
		justep.Shell.showPage("testOrder");	
	};
	
	return Model;
});