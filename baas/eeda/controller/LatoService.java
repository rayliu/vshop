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
	//获取轮回图片
	public static JSONObject carousel(JSONObject params, ActionContext context) throws Exception{
		JSONObject json =new JSONObject();
		try
		{
			json = LoadJson.load("轮播图片表");
			System.out.println("轮播图片表"+json);
		}finally{
			return json;
		}
	}
	 //获取首页商品
	public static JSONObject getGoods(JSONObject params, ActionContext context) throws Exception{
		JSONObject json =new JSONObject();
		try
		{
			json = LoadJson.load("商品表");
			System.out.println(json);
		}finally{
			return json;
		}
	}
	
	
	 //获取商店表
		public static JSONObject queryShop(JSONObject params, ActionContext context) throws Exception{
			JSONObject json =new JSONObject();
			try
			{
				json = LoadJson.load("商店表");
				System.out.println(json);
			}finally{
				return json;
			}
		}
	
	//获取分类数据
	public static JSONObject queryCategory(JSONObject params, ActionContext context) throws Exception{
		JSONObject json =new JSONObject();
		try
		{
			json = LoadJson.load("分类表");
		}finally{
			return json;
		}
	}

	
	
	//获取购物车数据
	public static JSONObject queryCartGoods(JSONObject params, ActionContext context) throws Exception{
		JSONObject json =new JSONObject();
		try
		{
			json = LoadJson.load("购物车商品表");
			System.out.println(json);
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

		System.out.println("内容："+tableName+templateName+value);
		try
		{
			json = LoadJson.query(tableName,templateName,value,type);
			System.out.println("搜索："+json);
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
}
