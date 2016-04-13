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
	
	
	
	Model.prototype.订单表CustomRefresh = function(event){
		var user = localStorage.getItem("userID");
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryByValue",
			"async" : false,
			"params" :  {tableName:'订单表',templateName:'f11',value:user},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
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
	
	

	
	
	Model.prototype.订单商品表CustomRefresh = function(event){
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryTable",
			"async" : false,
			"params" :  {tableName:'订单商品表'},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});
	};
	
	

	
	//订单取消
	Model.prototype.cancelClick = function(event){
		this.comp('cancel').set("disabled",true);
		var self = this;
		var row = event.bindingContext.$object;
		var objectId = row.val("objectId");
		var obj={};
		obj.状态 = '订单已取消';
		var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "updateOrder",
			"async" : false,
			"params" :  {tableName:'订单表',objectId:objectId,json:JSON.stringify(obj) },
			"success" : function(data) {
				if(data.result=="success"){
					justep.Util.hint("订单已取消");
					self.scrollView4PullDown();
				}else{
					this.comp('cancel').set("disabled",false);
					justep.Util.hint("操作失败", {
						"type" : "danger"
					});
				}
			}
		});
	};
	
	

	
	//订单付款
	Model.prototype.payClick = function(event){
		this.comp('pay').set("disabled",true);
		var row = event.bindingContext.$object;
		var objectId = row.val("objectId");
		var payMonny = row.val("总价");
		var orderNo = row.val("编号");
		/*var dataR = event.source;
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "queryTable",
			"async" : false,
			"params" :  {tableName:'订单表'},
			"success" : function(data) {
				dataR.loadData(data);
			}
		});*/
	};
	
	

	
	//订单删除
	Model.prototype.deleteClick = function(event){
		this.comp('delete').set("disabled",true);
		var self = this;
		var row = event.bindingContext.$object;
		var objectId = row.val("objectId");
		var number = row.val("编号");

		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "deleteOrder",
			"async" : false,
			"params" :  {tableName:'订单表',value:objectId},
			"success" : function(data) {
				if(data.result=="success"){
					justep.Util.hint("订单已删除");
					deleteQuery(self,number);
					self.scrollView4PullDown();
				}else{
					this.comp('delete').set("disabled",false);
					justep.Util.hint("操作失败", {
						"type" : "danger"
					});
				}
			}
		});

	};
	
	var deleteQuery = function(self,number){
		justep.Baas.sendRequest({
			"url" : "/eeda/shop",
			"action" : "deleteQueryOrder",
			"async" : false,
			"params" :  {
				tableName:'订单商品表',
				templateName:'f2',
				value:number,
				type:'equal',
			},
			"success" : function(data) {
				if(data.result=='success'){
				}
			}
		});
	}
	
	

	
	//下拉刷新
	Model.prototype.scrollView4PullDown = function(event){
		this.comp("订单表").refreshData();
		this.comp("订单商品表").refreshData();
	};
	
	

	
	
	return Model;
});