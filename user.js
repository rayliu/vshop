define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");

	
	
	var Model = function() {
		this.callParent();
		this.divShow=localStorage.getItem("userID")?false:true;//隐藏与显示DIV
		this.divInfoShow=localStorage.getItem("userID")?true:false;//隐藏与显示DIV
	};
	
	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};
	Model.prototype.userLoginBtn = function(event){
		justep.Shell.showPage("login");
	};
	Model.prototype.modelModelConstruct = function(event){
		$(this.getElementByXid("userInfo")).text(localStorage.getItem("username"))//拿到用户名称回显
	};
	return Model;
});