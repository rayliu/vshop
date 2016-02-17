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
	Model.prototype.userLoginBtn = function(event){
		justep.Shell.showPage("login");
	};
	Model.prototype.modelModelConstruct = function(event){
		var divBtn=localStorage.getItem("userID")//隐藏与显示DIV
		if(divBtn===null){
			$(this.getElementByXid("divinfo")).hide();
			$(this.getElementByXid("userDivBtn")).show();
		}else{
			$(this.getElementByXid("divinfo")).show();
			$(this.getElementByXid("userDivBtn")).hide();
			$(this.getElementByXid("userInfo")).text(localStorage.getItem("username"))//拿到用户名称回显	
		}
		
	};
	return Model;
});