define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	var Model = function() {
		this.callParent();
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	Model.prototype.button3Click = function(event) {
		justep.Shell.showPage("registeMobile");
	};

	Model.prototype.div6Click = function(event){
		var type={
					btnType:"phone"
				}
		justep.Shell.showPage("registeMobile",type);
	};

	Model.prototype.div9Click = function(event){
		var type={
					btnType:"email"
				}
		justep.Shell.showPage("registeMobile",type);
	};

	Model.prototype.button4Click = function(event){
		justep.Shell.showPage("registeMobile");
	};

	return Model;
});