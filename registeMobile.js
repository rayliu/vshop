define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = justep.Baas;
	require("cordova!com.justep.cordova.plugin.security.mob");
	var Model = function() {
		this.callParent();
	};

	// 依据 verify 返回值决定向Baas 保存用户。
	// 使用的是第一种方式。更安全的要求参见第二种方式
	// 第二种方式: http://wiki.mob.com/smssdk-service-verify/
	Model.prototype.verifyButton = function(event) {
		justep.Baas.sendRequest({
				"url" : "/eeda/shop",
				"action" : "userRegisterPhone",
				"async" : false,
				"params" : {},
				"success" : function(data) {
					justep.Util.hint("测试成功");
				}
			});
		//var self = this;
		//var phoneInput = this.comp("phonenumber").val();
		//var verifyCode = this.comp("verifyCode").val();
		//var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
		//var verifyCodeReg = /^\d{4}$/;
		//if (verifyCodeReg.test(verifyCode) && reg.test(phoneInput)) {
			
		//}
	};
	Model.prototype.sendsmsbuttonClick = function(event){
		var userInfoData = this.comp("userInfoData");
		var emailNumber = this.comp("emailNumber").val();
		var password = this.comp("password").val();
		debugger;
		/*userInfoData.newData({
				"defaultValues" : [ {
					"login_id" : "aaaa",
					"login_pwd" : "bbbb",
				} ]
			});*/
		userInfoData.setValue("status", 0);
		userInfoData.setValue("login_id", "aa");
		userInfoData.setValue("login_pwd", "dd");
		userInfoData.setValue("nickname", "cc");
		userInfoData.setValue("reg_time", null);
		userInfoData.setValue("info", "aa");
		userInfoData.setValue("tag", "ss");
		var reslut = userInfoData.saveData();
		alert(reslut)
		/*justep.Baas.sendRequest({
				"url" : "/eeda/shop",
				"action" : "userRegisterEmail",
				"async" : false,
				"params" : {"emailNumber":emailNumber},
				"success" : function(data) {
					//userInfoData.setValue("login_id",emailNumber);
					//userInfoData.setValue("login_pwd",password);
					justep.Util.hint("注册成功");
				}
			});*/
	};
	Model.prototype.dbTestClick = function(event) {
		var self = this;
		var testData = this.comp("userInfoData");
		testData.refreshData();
		testData.newData({
			index : 0,
			defaultValues : [ {
				"id" : justep.UUID.createUUID(),
				"status" : "0",
				"passwd" : "2014-12-30 00:55:49",
				"nickname" : "test",
				"info" : "test add"
			} ]
		});

		function onsuccess(info, phoneInput) { // for test
			if (info.result == -1) {
			debugger
				var userData = self.comp('userInfoData');
				userData.setValue("id","28");
				var reslut = userData.saveData();

			} else
				justep.Util.hint("验证失败：" + JSON.stringify(info), {
					"type" : "danger"
				});
		}
		;

		onsuccess({
			result : -1
		}, "18501978580");
	};
	return Model;
});