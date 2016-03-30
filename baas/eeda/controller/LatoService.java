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
		
		
		System.out.println("接口内容："+tableName+functionName+"value:"+value);
		try
		{
			json = LoadJson.queryInterface(tableName,functionName,value);
		
			System.out.println("接口搜索："+json);
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
		try
		{
			oJson = LoadJson.create(tableName,json);
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
		try
		{
			String[] array = value.split(",");
			for (int i = 0; i < array.length; i++) {
				result = LoadJson.delete(tableName,array[i]);
				json.put("result", result);
				System.out.println("删除："+i+":"+result);
			}
		}finally{
			return json;
		}
	}
	
	//通过objectId更新表信息
	public static JSONObject updateOrder(JSONObject params, ActionContext context) throws Exception{
		LOAFormDataObject vObj = null;
		JSONObject json =new JSONObject();
		String tableName = params.getString("tableName");      //表明
		String objectId = params.getString("objectId");        //更新的objectId 
		String templateName = params.getString("templateName");//更新的表字段名
		String value = params.getString("value");           //更新的信息
		String result = "fail";
		try
		{
			result = LoadJson.updateByObjectId(tableName,objectId,templateName,value);
			json.put("result", result);
			System.out.println("更新："+objectId+":"+result);
			
		}finally{
			return json;
		}
	}
}
