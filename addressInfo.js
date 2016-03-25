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
	
	
	
	Model.prototype.saveBtnClick = function(event){
		var self = this;
		self.comp("saveBtn").set('disabled',true);
		
		var name = this.comp('nameInput').val();
		var phone = this.comp('phoneInput').val();
		var address = this.comp('addressInput').val();
		var mail = this.comp('mailInput').val();
		var lock = this.comp('lockInput').val();
		var user = localStorage.getItem("userID");
		
		if(name==''||phone==''||address==''){
			justep.Util.hint("请填写完整信息 ", {
				"type" : "danger"
			});
			self.comp("saveBtn").set('disabled',false);
			return false;
		}
		
		var obj = {};
		obj.姓名 = name;
		obj.电话 = phone;
		obj.地址 = address;
		obj.邮编 = mail;
		obj.是否启用 = lock;
		obj.用户编号 = user;

		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "createOrder",
				"params" : {
				"tableName":"收货地址表",
				"json" : JSON.stringify(obj) 
			},
			"success" : function(resultData) {
				if(resultData.id){
					justep.Util.hint("保存成功！");
				}else{
					justep.Util.hint("保存失败 ", {
						"type" : "danger"
					});
					self.comp("saveBtn").set('disabled',false);
				}
					
			}
		});
	};
	
	Model.prototype.modelModelConstruct = function(event){
		this.comp('lockInput').val('是');
	};
	
	
	return Model;
});