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
	Model.prototype.showUserInfo = function() {
		var divBtn=localStorage.getItem("userID")//隐藏与显示DIV
		if(divBtn===null){
			$("#divinfo").hide();
			$("#userDivBtn").show();
		}else{
			$("#divinfo").show();
			$("#userDivBtn").hide();
			$("#userInfo").text(localStorage.getItem("username"))//拿到用户名称回显	
		}
	};
	Model.prototype.userLoginBtn = function(event){
		justep.Shell.showPage("login");
	};
	Model.prototype.modelModelConstruct = function(event){
		this.showUserInfo();
	};
	
	Model.prototype.usernameInfoClick = function(event){
	var islogin=localStorage.getItem("userID")//判断用户是否登陆
		if(islogin===null){
			justep.Shell.showPage("login");
		}else{
			justep.Shell.showPage("userInfo");
		}
		
	};
	
	Model.prototype.button12Click = function(event){
		justep.Shell.showPage("registered");
	};
	
	return Model;
});