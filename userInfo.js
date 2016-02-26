define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	
	var Model = function(){
		this.callParent();
	};
	//返回上一页
	Model.prototype.userBackBtnClick = function(event){
		justep.Shell.closePage();
	};
	
	Model.prototype.cancelBtnClick = function(event){
		localStorage.removeItem("userID");
		localStorage.removeItem("nickname");
		localStorage.removeItem("username");
		var status={
					status:"login"
				}
		justep.Shell.showPage("main",status);
	};
	
	Model.prototype.modelModelConstruct = function(event){
		$("#userNameSpan").text(localStorage.getItem("username"))//拿到用户名称回显
		$("#userNick").text(localStorage.getItem("nickname"))//拿到用户昵称回显
	};
	
	return Model;
});