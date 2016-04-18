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
	
	//更改默认地址
	var changeIsLock = function(user){
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"params" : {
				"tableName":"收货地址表",
				'templateName':'f7,f2',
				"value" : '是 ,'+user
			},
			"success" : function(data) {
				if(data.rows.length>0){
				    var thisObjectId = $(data.rows).attr('objectId').value;
				    var array = {};
				    array.是否启用='否';
				    
				    justep.Baas.sendRequest({
					"url" : "/eeda/shop",
					"action" : "updateOrder",
					"params" : {
						"tableName":"收货地址表",
						'objectId':thisObjectId,
						"json" : JSON.stringify(array) 
					},
					"success" : function(resultData) {
						if(resultData.result=='success'){
						}else{
							justep.Util.hint("更新失败 ", {
								"type" : "danger"
								});
							}
						}
					});
				    
				}
			}
		});
	}
	
	
	
	var updateOrder = function(objectId,obj,self){
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "updateOrder",
			"params" : {
				"tableName":"收货地址表",
				'objectId':objectId,
				"json" : JSON.stringify(obj) 
			},
			"success" : function(resultData) {
			if(resultData.result=='success'){
				justep.Util.hint("更新成功！");
				self.comp("saveBtn").set('disabled',false);
				if(self.params.pageName!=undefined){
					justep.Shell.setIsSinglePage(true);
					justep.Shell.showPage(self.params.pageName, {
						"cardIDs":self.params.cardIDs
					});
				}else
					justep.Shell.showPage("address");	
			}else{
				justep.Util.hint("更新失败 ", {
					"type" : "danger"
				});
				self.comp("saveBtn").set('disabled',false);
				}
				
			}
		});
	}
	
	var saveOrder = function(obj,self){
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
					self.comp("saveBtn").set('disabled',false);
					if(self.params.pageName!=undefined){
						/*justep.Shell.setIsSinglePage(true);
						justep.Shell.showPage(self.params.pageName,{'pageName':'addressInfo'});*/
						justep.Shell.setIsSinglePage(true);
						justep.Shell.showPage(self.params.pageName, {
							"cardIDs":self.params.cardIDs
						});
					} else
						justep.Shell.showPage("address");	
				}else{
					justep.Util.hint("保存失败 ", {
						"type" : "danger"
					});
					self.comp("saveBtn").set('disabled',false);
				}
					
			}
		});
	}
	
	
	
	Model.prototype.saveBtnClick = function(event){
		var self = this;
		self.comp("saveBtn").set('disabled',true);
		var objectId = this.comp('收货地址表').val('objectId');
		var isLock = this.comp('收货地址表').val('是否启用');//更改前默认状态
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
		
		if(self.params.addressId != undefined){
			//更改默认地址
			if(lock=='是' && isLock == '否'){  //当当前状态有原来的否更改为是时
				//先查询出现在的默认地址
				//更新其是否启用为否
				changeIsLock(user);
			}
			updateOrder(objectId,obj,self);	
		}else{
			//更改默认地址
			if(lock=='是'){
				//先查询出现在的默认地址
				//更新其是否启用为否
				changeIsLock(user);
			}
		
			//保存单据
			saveOrder(obj,self);
		}
	};
	
	Model.prototype.收货地址表CustomRefresh = function(event){
		var self = this;
		if(self.params.addressId == undefined){
			self.comp("lockInput").val('是');
			return;
		}
		
		var user = localStorage.getItem("userID");
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" :  {tableName:'收货地址表',templateName:'f1',value:this.params.addressId},
			"success" : function(data) {
				self.comp("nameInput").val($(data.rows).attr('姓名').value);
				self.comp("phoneInput").val($(data.rows).attr('电话').value);
				self.comp("addressInput").val($(data.rows).attr('地址').value);
				self.comp("mailInput").val($(data.rows).attr('邮编').value);
				self.comp("lockInput").val($(data.rows).attr('是否启用').value);
				dataR.loadData(data);
			}
		});
	};
	
	Model.prototype.modelModelConstruct = function(event){
		
	};
	
	
	return Model;
});