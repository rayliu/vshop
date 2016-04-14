package eeda.controller;

//import java.util.List;
//import java.util.Map;
//
//import loa.biz.LOAFormDataObject;
//
//import com.google.gson.Gson;
//import com.google.gson.reflect.TypeToken;
//import com.justep.baas.action.ActionContext;
//import com.alibaba.fastjson.JSONObject;
//import eeda.controller.LoadJson;
//import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import loa.biz.LOAFormDataObject;
import com.google.gson.Gson;
import com.justep.baas.action.ActionContext;
import com.alibaba.fastjson.JSONObject;
import eeda.controller.LoadJson;
import java.util.HashMap;



public class LatoService{
	
	//查询表信息
	public static JSONObject queryTable(JSONObject params, ActionContext context) throws Exception{
		JSONObject json =new JSONObject();
		String tableName = params.getString("tableName");
		try
		{
			System.out.println("查询表内容："+tableName);
			json = LoadJson.load(tableName);
			if(json==null){
				json = new JSONObject();
				json.put("@type", "table");
				json.put("rows", "");
			}
		}catch(Exception nex){
			System.out.println(nex.getMessage());
		}finally{
			return json;
		}
	}
	
	

	
	//通过内容获取表信息
	public static JSONObject queryByValue(JSONObject params, ActionContext context) throws Exception{
		JSONObject json =new JSONObject();
		String tableName = params.getString("tableName");
		String templateName = params.getString("templateName");
		String value = params.getString("value");
		String type = params.getString("type");
		System.out.println("通过条件查询表："+tableName+" templateName:"+templateName+" value:"+value);
		try
		{
			json = LoadJson.query(tableName,templateName,value,type);
			if(json==null){
				json = new JSONObject();
				json.put("@type", "table");
				json.put("rows", "");
			}
		}catch(Exception nex){
			System.out.println(nex.getMessage());
		}finally{
			return json;
		}
	}
	
	
	//获取接口信息
	public static JSONObject queryInterface(JSONObject params, ActionContext context) throws Exception{
		JSONObject json =new JSONObject();
		String tableName = params.getString("tableName");
		String functionName = params.getString("functionName");
		String value = params.getString("value");
		
		
		System.out.println("查询接口内容："+tableName+"functionName:"+functionName+"value:"+value);
		try
		{
			json = LoadJson.queryInterface(tableName,functionName,value);
			if(json==null){
				json = new JSONObject();
				json.put("@type", "table");
				json.put("rows", "");
			}
		}catch(Exception nex){
			System.out.println(nex.getMessage());
		}finally{
			return json;
		}
	}
	
	
	//生成单据
	public static JSONObject createOrder(JSONObject params, ActionContext context) throws Exception{
		LOAFormDataObject vObj = null;

		String tableName = params.getString("tableName");
		JSONObject oJson =new JSONObject();
		String json =  params.getString("json");
		System.out.println("生成单据："+tableName);
		try
		{
			oJson = LoadJson.create(tableName,json);
		}catch(Exception nex){
			System.out.println(nex.getMessage());
		}finally{
			return oJson;
		}
	}
	
	
	//删除单据
	public static JSONObject deleteOrder(JSONObject params, ActionContext context) throws Exception{
		LOAFormDataObject vObj = null;
		JSONObject json =new JSONObject();
		String tableName = params.getString("tableName");
		String value = params.getString("value");
		String result = "fail";
		System.out.println("删除单据："+tableName+" objectId:"+value);
		try
		{
			String[] array = value.split(",");
			for (int i = 0; i < array.length; i++) {
				result = LoadJson.delete(tableName,array[i]);
				json.put("result", result);
				System.out.println("删除："+i+":"+result);
			}
		}catch(Exception nex){
			System.out.println(nex.getMessage());
		}finally{
			return json;
		}
	}
	
	//通过objectId更新表信息
	public static JSONObject updateOrder(JSONObject params, ActionContext context) throws Exception{
		LOAFormDataObject vObj = null;
		JSONObject oJson =new JSONObject();
		String tableName = params.getString("tableName");      //表明
		String objectId = params.getString("objectId");        //更新的objectId 
//		String templateName = params.getString("templateName");//更新的表字段名
//		String value = params.getString("value");           //更新的信息
		String json =  params.getString("json");
		String result = "fail";
		try
		{
			result = LoadJson.updateByObjectId(tableName,objectId,json);
			oJson.put("result", result);
			System.out.println("更新："+objectId+":"+result);
			
		}catch(Exception nex){
			System.out.println(nex.getMessage());
		}finally{
			return oJson;
		}
	}
	
	//查询字表数据
	public static JSONObject queryChildTable(JSONObject params, ActionContext context) throws Exception{
		LOAFormDataObject vObj = null;
		JSONObject json =new JSONObject();
		String tableName = params.getString("tableName");      //表名
		String objectId = params.getString("objectId");        //objectId 
		String childTableName = params.getString("childTableName");//字表名
		try
		{
			json = LoadJson.queryChlidTable(tableName,objectId,childTableName);
			if(json==null){
				json = new JSONObject();
				json.put("@type", "table");
				json.put("rows", "");
			}
			System.out.println("查询子表："+tableName);
		}catch(Exception nex){
			System.out.println(nex.getMessage());
		}finally{
			return json;
		}
	}
	
	//新增字表数据
	public static JSONObject createChildOrder(JSONObject params, ActionContext context) throws Exception{
		LOAFormDataObject vObj = null;
		JSONObject oJson =new JSONObject();
		String tableName = params.getString("tableName");      //表名
		String objectId = params.getString("objectId");       //objectId 
		String childTableName = params.getString("childTableName");////字表名
		String json =  params.getString("json");
		try
		{
			oJson = LoadJson.createChild(tableName,objectId,childTableName,json);
			System.out.println("新增："+oJson);
			
		}catch(Exception nex){
			System.out.println(nex.getMessage());
		}finally{
			return oJson;
		}
	}
	
	//查询内容并删除
	public static JSONObject deleteQueryOrder(JSONObject params, ActionContext context) throws Exception{
		LOAFormDataObject vObj = null;
		JSONObject json =new JSONObject();
		String tableName = params.getString("tableName");
		String templateName = params.getString("templateName");
		String value = params.getString("value");
		String type = params.getString("type");
		String result = "fail";
		System.out.println("删除字表单据："+tableName+" objectId:"+value);
		try
		{
			String[] array = value.split(",");
			for (int i = 0; i < array.length; i++) {
				result = LoadJson.deleteQuery(tableName,templateName,value,type);
				json.put("result", result);
				System.out.println("删除："+i+":"+result);
			}
		}catch(Exception nex){
			System.out.println(nex.getMessage());
		}finally{
			return json;
		}
	}
	
	
}
