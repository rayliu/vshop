define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = justep.Baas;
	var emailVerify="";
	var variety="";
	require("cordova!com.justep.cordova.plugin.security.mob");
	var Model = function() {
		this.callParent();
	};

	Model.prototype.verifyButton = function(event) {
		if(variety=='email'){
			var nickInput=this.comp("nickInput").val();
			var password = this.comp("password").val();
			var emailNumber = this.comp("varietyNumber").val();
			var verifyCode = this.comp("verifyCode").val();
			var userInfoData = this.comp("userInfoData");
			if(verifyCode==emailVerify){				
				var obj={};	
				obj.用户名 = emailNumber;
				obj.密码 = password;
				obj.昵称 = nickInput;
				obj.状态 = "1";
				
				// 通过Baas保存数据
				event.cancel = true;
				var Rdata = event.source;
				justep.Baas.sendRequest({
					"url" : "/eeda/shop",
					"action" : "createOrder",
					"params" : {
						"tableName":"用户表",
						"json" : JSON.stringify(obj) 
					},
					"success" : function(resultData) {
						justep.Shell.showPage("order", {
							orderID : resultData.id
						});
					}
				});
				
				justep.Util.hint("注册成功！");
				justep.Shell.showPage("login");
			}else{
				justep.Util.hint("验证码有误",{
					"type" : "danger"
					});
			}
		}else if(variety=='phone'){
			
		}else{
			justep.Util.hint("系统内部错误请刷新后重试",{
				"type" : "danger"
				});
		}
	};
	Model.prototype.sendsmsbuttonClick = function(event){
		if(variety=='email'){
			var emailNumber = this.comp("varietyNumber").val();
			var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (filter.test(emailNumber)){
				justep.Baas.sendRequest({
						"url" : "/eeda/shop",
						"action" : "userRegisterEmail",
						"async" : false,
						"params" : {"emailNumber":emailNumber},
						"success" : function(data) {
							emailVerify=data.backStr;
						}
					});
			}else{
				justep.Util.hint("请输入正确的邮箱",{
					"type" : "danger"
					});
			}
		}else if(variety=='phone'){
			var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
			var verifyCodeReg = /^\d{4}$/;
			var fPhoneNumber=this.comp("varietyNumber").val();
			if (reg.test(fPhoneNumber)) {
				justep.Baas.sendRequest({
						"url" : "/eeda/shop",
						"action" : "testPhone",
						"params" : {"fPhoneNumber":fPhoneNumber},
						"success" : function(data) {
							
						}
					});
			}else{
				justep.Util.hint("请输入正确的手机号码",{
					"type" : "danger"
					});
			}
		}else{
			justep.Util.hint("系统内部错误请刷新后重试",{
					"type" : "danger"
					});
		}
	};
	Model.prototype.modelParamsReceive = function(event){
		var btnType=event.params.btnType;
		variety=btnType;
		if(btnType=='phone'){
			$("#spanValue").text("手机注册");
			$("#spanValue1").text("手机号");
		}else if(btnType=='email'){
			$("#spanValue").text("邮箱注册");
			$("#spanValue1").text("邮箱");
		}
	};
	
	Model.prototype.用户表CustomRefresh = function(event){
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryTable",
			"async" : false,
			"params" : {tableName:"用户表"},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};
	

Model.prototype.varietyNumberKeyup = function(event){
		var mail = $('[xid=varietyNumber]').val();
		var Rdata =  this.comp("用户表");
		Rdata.each(function(obj){
			var oldMail = Rdata.val('用户名',obj.row);
			if(mail==oldMail){
				justep.Util.hint('此邮箱已注册',{
					"type" : "danger"
				});
				//$('#sendBtn').attr('disabled',true);
				return;
			}else{
				//$('#sendBtn').attr('disabled',false);
			}
		});
	};

	return Model;
});