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
	
	
	
	Model.prototype.收货地址表CustomRefresh = function(event){
		var user = localStorage.getItem("userID");
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" :  {tableName:'收货地址表',templateName:'f2',value:user},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};
	
	//修改按钮
	Model.prototype.button3Click = function(event){
		var islogin=localStorage.getItem("userID")//判断用户是否登陆
		if(islogin===null){
			justep.Shell.showPage("login");
		}else{
			justep.Shell.showPage("addressInfo");
		}
	};
	
	//删除按钮
	Model.prototype.a2Click = function(event){
		var self=this;
		var row = event.bindingContext.$object;
		var user = localStorage.getItem("userID");
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "deleteOrder",
			"async" : false,
			"params" :  {tableName:'收货地址表',value:row.val('objectId')},
			"success" : function(data) {
				if(data.result=='success'){
					justep.Util.hint("删除成功");
					self.comp("收货地址表").refreshData();
				}else{
					justep.Util.hint("删除失败", {
						"type" : "danger"
					});
				}
			}
		});
	};
	
	
	Model.prototype.a1Click = function(event){
		var row = event.bindingContext.$object;
		justep.Shell.showPage("addressInfo", {
			"addressId" :row.val('编号')
		});
	};
	
	
	Model.prototype.radio1Change = function(event){
		var row = event.bindingContext.$object;
		var objectId = row.val('objectId');
		var dataR = this.comp('收货地址表');
		
		dataR.each(function(obj){
			var array = {};
			var newId = dataR.val('objectId',obj.row);
			if(dataR.val('objectId',obj.row)==objectId){
				array.是否启用 = '是';
			}else{
				array.是否启用 = '否';
			}
			justep.Baas.sendRequest({
						"url" : "/eeda/shop",
						"action" : "updateOrder",
						"async" : false,
						"params" :  {tableName:'收货地址表',objectId:newId,json:JSON.stringify(array)},
						"success" : function(data) {
						if(data.result=='success'){
							justep.Util.hint("修改成功");
						}else{
							justep.Util.hint("修改失败", {
								"type" : "danger"
							});
						}
					}
				});
		});
	};
	
	
	return Model;
});