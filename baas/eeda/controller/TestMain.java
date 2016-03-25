package eeda.controller;


import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import eeda.controller.LoadJson;

import loa.biz.LOAApp;
import loa.biz.LOAFilterExpressionItem;
import loa.biz.LOAFilterExpressionItem.FilterOperator;
import loa.biz.LOAFilterItem;
import loa.biz.LOAFormList;
import loa.biz.LOAParamValueList;
import loa.biz.LOAQueryInfo;
import net.sf.json.JSONObject;

public class TestMain {
	static String appName="7cfefd52-27f6-4600-9ad5-efe28441f216";
	static String appKey="b642c0ae-8df1-4017-9c90-de28b9812771";

	
	public static void main(String[] args) {
		com.alibaba.fastjson.JSONObject json = LoadJson.query("购物车商品表", "f18", "1,2,3", "in");
		System.out.print("**********----***"+json);
		System.out.println("*end****");
		
	}
	
	//云表接口调用
		public static JSONObject queryInterface(String tableName,String functionName) {
			LOAApp vApp = LOAApp.getInstance();
			LOAFormList vObjList = null;
			vApp.init("http://cc.iyunbiao.cn/openapi/1.0",
					appName,
					appKey, true);	
			try {
				vApp.login("admin", "admin");
				
				LOAQueryInfo queryInfo = vApp.createQueryInfo();
				
				LOAParamValueList paramManager = queryInfo.getParamValueList();
				
				queryInfo.getPageInfo().SetToLoadAllConfig();
				
				// 创建查询对象的过滤项（对一个查询对象，可以添加多个数据项的查询）
				//paramManager.add("value",value);
				//paramManager.add("value",value);

				vObjList = vApp.query(tableName,functionName ,queryInfo);
				
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			return change(vApp,vObjList);
		}
	
	
	
	public static JSONObject query(String tableName,String templateName,String value) {
		LOAApp vApp = LOAApp.getInstance();
		LOAFormList vObjList = null;
		vApp.init("http://cc.iyunbiao.cn/openapi/1.0",
				appName,
				appKey, true);	
		try {
			vApp.login("admin", "admin");
			
			LOAQueryInfo queryInfo = vApp.createQueryInfo();
			// 创建查询对象的过滤项（对一个查询对象，可以添加多个数据项的查询）
			LOAFilterItem vFilterItem = queryInfo.getFilterList().add(templateName);
			
			// 过滤项配置过滤信息(对一个数据项，可以设置多个查询值项)
			LOAFilterExpressionItem vFilterValueItem =  vFilterItem.getExpressionList().add();
			vFilterValueItem.IsAnd = true;
			vFilterValueItem.Operator = FilterOperator.Equal; // 等于
			vFilterValueItem.Value 	= value;
			vObjList = vApp.getFormList(tableName, queryInfo);
			
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return change(vApp,vObjList);
	}
	
	
	public static JSONObject change(LOAApp vApp, LOAFormList list) {
 		JSONObject json =new JSONObject();
 		Set nameArray = null; //表字段名集合
 		Collection valueArray = null; //表字段值名集合
 		String stringArray = "String";  ////表字段值类型集合
        try {
			//LOAFormList list = vApp.getFormList(tableName);
			Gson gson = new Gson(); 
			List<Map> idList = new Gson().fromJson(list.saveToJson().toString(), 
					new TypeToken<List<Map>>(){}.getType());
			json.put("@type", "table");
			
			List<Map> listMap = new ArrayList<Map>();
			for(Map item : idList){
				Map array = new HashMap();
				for (int i = 0; i < item.size(); i++) {
					nameArray = item.keySet();
					valueArray = item.values();
					Object key=item.keySet().toArray()[i];
					Object value= item.values().toArray()[i];
					Map array2 = new HashMap();
					array2.put("value", value);
					array.put(key, array2);
				}
				listMap.add(array);
			}
			json.put("rows", listMap);
			
			for (int i = 0; i < nameArray.size()-1; i++) {
				if(nameArray.toArray()[i].equals("objectId"))
					stringArray += ",Integer";
				if(nameArray.toArray()[i].equals("objectVersion"))
					stringArray += ",Integer";
				if(nameArray.toArray()[i].equals("objectLocked"))
					stringArray += ",boolean";
				else
					stringArray += ",String";
			}
			
			Map array3 = new HashMap();
			array3.put("relationAlias", nameArray.toString().substring(1,nameArray.toString().length()-1));
			array3.put("relationTypes", stringArray);
			json.put("userdata", array3);
        }  catch(Exception ex){
        	ex.printStackTrace();
        }
        return json;
    }
	
	
}