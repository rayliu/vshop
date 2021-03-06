define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var Baas = justep.Baas;
	require("cordova!plugin.http.request");
	require("cordova!com.justep.cordova.plugin.qq");
	require("cordova!com.justep.cordova.plugin.weibo");
	require("cordova!com.justep.cordova.plugin.weixin.v3");

	// 仅作为示例用，如果正式开发，更好的方案参见takeout,从云服务器去请求微信
	var weixinApp = "wxc08fa78b0a117595";
	var weixinSecrt = "648dc0f1d889525095ed0cb2bea05720";

	var qqAppId = "1105114302";// demo QQ app id.

	var Model = function() {
		this.callParent();
	};

	// 图片路径转换
	Model.prototype.getImageUrl = function(url) {
		return require.toUrl(url);
	};

	// 进入注册页
	Model.prototype.registeredClick = function(event) {
		justep.Shell.showPage("registered");
	};

	Model.prototype.QQlogin = function(event) {
		var self = this;
		function success(info) {
			var user = {};
			user.userid = info.userid;
			user.accountType = "QQ";
			if (info.userid && info.access_token) {
				self.oathQQInfo(qqAppId, info.access_token, info.userid, function(name) {
					user.name = name || "NONAME";

					justep.Shell.userType.set(user.accountType);
					justep.Shell.userName.set(user.name);
					localStorage.setItem("userUUID", JSON.stringify(user));
					justep.Util.hint("登录成功");
					setTimeout(function() {
						justep.Shell.showPage("main");
					}, 3000);
				});

			}
		}
		;
		navigator.QQ.ssoLogin(success, function(info) {
			alert("登录失败");
		});

	};

	Model.prototype.WeiboLogin = function(event) {

		var self = this;
		var onSuccess = function(info) {
			if (!info) {
				justep.Util.hint("登录失败 ", {
					"type" : "danger"
				});
				return;
			}
			var user = {};
			user.userid = info.id;
			user.accountType = "Weibo";
			user.name = info.name || "NONAME";

			justep.Shell.userType.set(user.accountType);
			justep.Shell.userName.set(user.name);
			localStorage.setItem("userUUID", JSON.stringify(user));
			justep.Util.hint("登录成功");

			setTimeout(function() {
				if(this.params.pageName!='')
					justep.Shell.showPage(this.params.pageName);
				else
					justep.Shell.showPage("main");
			}, 3000);

		}

		navigator.Weibo.ssoLogin(function(info) {
			self.oathWeiboInfo(info.access_token, info.userid, onSuccess);
		}, function(info) {
			alert("登录失败");
		});

	};

	Model.prototype.oathQQInfo = function(appid, token, openid, success, error) {
		var qqUrl = "https://graph.qq.com/user/get_user_info?" + "access_token=" + token + "&" + "oauth_consumer_key=" + appid + "&" + "openid=" + openid + "&format=json";
		var httpReq = new plugin.HttpRequest();
		httpReq.getJSON(qqUrl, function(status, data) {
			// 这里返回用户的信息
			success(data.nickname);

		});

	}

	Model.prototype.oathWeiboInfo = function(access_token, uid, onSuccess) {
		var url = "https://api.weibo.com/2/users/show.json?access_token=" + access_token + "&uid=" + uid;
		var httpReq = new plugin.HttpRequest();
		httpReq.getJSON(url, function(status, data) {
			onSuccess(data);
		});

	}

	Model.prototype.saveAccount = function(event) {

	}

	Model.prototype.weiboLoginBtn = function(event) {
		navigator.Weibo.ssoLogin(function(mess) {
			alert(JSON.stringify(mess));
		}, function(mess) {
			alert(JSON.stringify(mess));
		});

	};

	// x5 app
	Model.prototype.loginWeixinClicked = function(event) {
		var self = this;
		if (!navigator.weixin) {
			justep.Util.hint("未安装微信V3插件 ", {
				"type" : "danger"
			});
			return;
		}

		var weixin = navigator.weixin;

		weixin.auth(function(info) {
			self.weixinCode2Token(info, self.authSuccess)
		},

		function(reason) {

			justep.Util.hint("登录失败: " + JSON.stringify(reason), {
				"type" : "danger"
			});
		});

	};

	Model.prototype.authSuccess = function(access_token, openid) {
		// https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID
		if (!(access_token && openid)) {
			justep.Util.hint("登录失败:", {
				"type" : "danger"
			});
			return;
		}

		var url = "https://api.weixin.qq.com/sns/userinfo?access_token=" + access_token + "&openid=" + openid;
		var httpReq = new plugin.HttpRequest();

		httpReq.getJSON(url, function(status, data) {

			if (status) {
				justep.Util.hint("登录失败:", {
					"type" : "danger"
				});
			}
			var user = {};
			user.userid = data.openid;
			user.accountType = "WX";
			user.name = data.nickname || "NONAME";

			justep.Shell.userType.set(user.accountType);
			justep.Shell.userName.set(user.name);
			localStorage.setItem("userUUID", JSON.stringify(user));
			justep.Util.hint("登录成功");

			setTimeout(function() {
				justep.Shell.showPage("main");
			}, 3000);
			// 微信的返回内容
			// "openid":"OPENID",
			// "nickname":"NICKNAME",
			// "sex":1,
			// "province":"PROVINCE",
			// "city":"CITY",
			// "country":"COUNTRY",
			// "headimgurl":
			// "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0",
			// "privilege":[
			// "PRIVILEGE1",
			// "PRIVILEGE2"
			// ],
			// "unionid": " o6_bmasdasdsad6_2sgVt7hMZOPfL"

		});
	};

	Model.prototype.weixinCode2Token = function(info, authSuccess) {
		var code = info.code;
		var url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + weixinApp + "&secret=" + weixinSecrt + "&code=" + code + "&grant_type=authorization_code";

		var httpReq = new plugin.HttpRequest();
		httpReq.getJSON(url, function(status, data) {

			if (status) {
				justep.Util.hint("登录失败:", {
					"type" : "danger"
				});
				return;
			}
			var unionid = data.unionid || "none";
			var openid = data.openid || "none";
			var access_token = data.access_token;
			authSuccess(access_token, openid);

		});

	};

	Model.prototype.loginBtn = function(event) {
		var self = this;
		var phoneInput = this.comp("nameInput").val();
		var passwordInput = this.comp("passwordInput").val();
		Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" : {
				//"filter" : " login_id ='"+phoneInput+"' and login_pwd ='"+passwordInput+"'"
				'tableName':'用户表','templateName':'f2','value' : phoneInput
			},
			"success" : function(data) {
				if (data.rows.length > 0) {
					if($(data.rows).attr('密码').value==passwordInput){
						localStorage.setItem("userID", $(data.rows).attr('编号').value);
						localStorage.setItem("nickname", $(data.rows).attr('昵称').value);
						localStorage.setItem("username",phoneInput);
						justep.Util.hint("登陆成功")
						var status={
							status:"login"
						}
						
						if(self.params.pageName!=undefined)
							justep.Shell.showPage(self.params.pageName,status);
						else
							justep.Shell.showPage("main",status);	
					}else{
						justep.Util.hint("密码有误！", {
						"type" : "danger"
						});
					}
				} else {
					justep.Util.hint("此用户没有注册", {
						"type" : "danger"
					});
				}
			}
		});

	};

	Model.prototype.registerClick = function(event){
		justep.Shell.setIsSinglePage(true);
		justep.Shell.showPage("registered",{});
	};

	return Model;
});