define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var ShellImpl = require('$UI/system/lib/portal/shellImpl');
	var CommonUtils = require("$UI/system/components/justep/common/utils");

	var Model = function() {
		this.callParent();
		var shellImpl = new ShellImpl(this, {
			"contentsXid" : "pages",
			"pageMappings" : {
				"main" : {
					url : require.toUrl('./main.w')
				},
				"list" : {
					url : require.toUrl('./list.w')
				},
				"class" : {
					url : require.toUrl('./class.w')
				},
				"detail" : {
					url : require.toUrl('./detail.w')
				},
				"search" : {
					url : require.toUrl('./search.w')
				},
				"cart" : {
					url : require.toUrl('./cart.w')
				},
				"order" : {
					url : require.toUrl('./order.w')
				},
				"success" : {
					url : require.toUrl('./success.w')
				},
				"login" : {
					url : require.toUrl('./login.w')
				},
				"user" : {
					url : require.toUrl('./user.w')
				},
				"userInfo" : {
					url : require.toUrl('./userInfo.w')
				},
				"addressInfo" : {
					url : require.toUrl('./addressInfo.w')
				},
				"address" : {
					url : require.toUrl('./address.w')
				},
				"goodsOrder" : {
					url : require.toUrl('./goodsOrder.w')
				},
				"registeMobile" : {
					url : require.toUrl('./registeMobile.w')
				},
				"registered" : {
					url : require.toUrl('./registered.w')
				},
				"testOrder" : {
					url : require.toUrl('./test/order.w')
				}
			}
		});
		//shellImpl.setIsSinglePage(true);
		shellImpl.useDefaultExitHandler = false;

		CommonUtils.attachDoubleClickExitApp(function() {
			
			var isHomePage = shellImpl.pagesComp.contents[0].innerContainer.getInnerModel().comp('contents2').getActiveIndex() == 0;
			if (shellImpl.pagesComp.getActiveIndex() === 0 && isHomePage) {
				return true;
			}
			return false;
		});

	};

	Model.prototype.modelLoad = function(event){
		justep.Shell.showPage("main");
	};

	return Model;
});