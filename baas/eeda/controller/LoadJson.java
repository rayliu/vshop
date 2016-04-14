package eeda.controller;

import java.util.ArrayList;

import loa.models.LOADataObject;
import loa.models.LOADataObjectList;
import loa.models.LOARawValue;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.util.Set;
import java.util.Collection;
import loa.biz.LOAApp;
import loa.biz.LOAFilterExpressionItem;
import loa.biz.LOAFilterExpressionItem.FilterOperator;
import loa.biz.LOAFilterItem;
import loa.biz.LOAFormList;
import loa.biz.LOAParamValueList;
import loa.biz.LOAQueryInfo;
import com.alibaba.fastjson.JSONObject;
import loa.biz.LOAFormDataObject;
import java.util.HashMap;
import java.util.Map.Entry;
import com.justep.baas.action.ActionContext;
import eeda.controller.LoadJson;




import eeda.controller.LoadJson;


public class LoadJson {
	static String appName="7cfefd52-27f6-4600-9ad5-efe28441f216";
	static String appKey="b642c0ae-8df1-4017-9c90-de28b9812771";
	static int i = 1;
	
	//检查是否已经登录
	static boolean isLogin= false;
	static LOAApp vApp = null ;
	public static void checkLogin(){
		if(!isLogin){
			try {	
				vApp = LOAApp.getInstance();
				
				vApp.init("http://cc.iyunbiao.cn/openapi/1.0",
						appName,
						appKey, true);	
				vApp.login("admin", "admin");
				isLogin=true;
				
			}catch (Exception e) {
				System.out.println(e.getMessage());
				while(i<5){
					i++;
					System.out.println("第"+i+"次报错");
					checkLogin();
				}
			}
		}
	}
	
	//查询字表
	public static JSONObject queryChlidTable(String tableName,String objectId,String childTableName) {	
		JSONObject jObj = null;
		try {
			LOAFormDataObject vObj = vApp.getFormDataObject(tableName,objectId);
			LOADataObjectList detailList = vObj.addObjectList(childTableName);
			if(detailList.getCount()>0)
				jObj = change(vApp,detailList.saveToJson());
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return jObj;
	}
	
	
	
	
	//新增子表
	public static JSONObject createChild(String tableName,String objectId,String childTableName,String json){
		JSONObject oJson =new JSONObject();
		try{
			LOAFormDataObject vObj = vApp.getFormDataObject(tableName,objectId);
			LOADataObjectList detailList = vObj.addObjectList(childTableName);
			LOADataObject dataRow = detailList.add();
			Gson gson = new Gson();
			Map<String, ?> dto= gson.fromJson(json, HashMap.class);
			for (Entry<String, ?> entry: dto.entrySet()) {
	            String role = entry.getKey();
	            String value =  entry.getValue().toString();
				dataRow.addRawValue(role, value);
			}
			vObj.save();
			//oJson.put("id", num);
			oJson.put("objectId", vObj.getObjectID());
			System.out.println("objectId*************************"+oJson);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}
		return oJson;
	}
	
	
	//编号
	public static int autoNumbe(String tableName){
		LOAFormList vObjList = null;
		int MaxNum = 0;	
		try{
			checkLogin();
			LOAFormList list = vApp.getFormList(tableName);
			
			List<Map> idList = new Gson().fromJson(list.saveToJson().toString(), 
					new TypeToken<List<Map>>(){}.getType());
			for(Map map:idList){
				int num = Integer.parseInt((String) map.get("编号"));
				if(MaxNum<num){
					MaxNum = num;
				}	
			}
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return (MaxNum+1);
	}
	
	
	//通过objectId更新表数据
		public static String updateByObjectId(String tableName,String objectId,String json){
			LOAFormDataObject vObj = null;
			String result = "fail";
			
			try{
				checkLogin();
				
				vObj = vApp.getFormDataObject(tableName, objectId);
				Gson gson = new Gson();
				Map<String, ?> dto= gson.fromJson(json, HashMap.class);
				for (Entry<String, ?> entry: dto.entrySet()) {
		            String role = entry.getKey();
		            String value =  entry.getValue().toString();
		            LOARawValue oldValue = vObj.getRawValue(role);
					oldValue.set(value);
				}
				vObj.save();
				result = "success";
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				System.out.println(e.getMessage());
			}
			return result;
		}
	
	//删除表数据
	public static String delete(String tableName,String value){
		LOAFormDataObject vObj = null;
		String result = "fail";
		
		try{
			checkLogin();
			vObj = vApp.getFormDataObject(tableName, value);
			if (null != vObj) {
				vObj.delete();
				result = "success";
			}	
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	
	//查询并删除
		public static String deleteQuery(String tableName,String templateName,String value,String type) {
			LOAFormList vObjList = null;
			String result ="fail";
			try {
				checkLogin();

				LOAQueryInfo queryInfo = vApp.createQueryInfo();
				// 创建查询对象的过滤项（对一个查询对象，可以添加多个数据项的查询）
				String[] templateNameArray = templateName.split(",");
				String[] valueArray = value.split(",");
				
				for (int i = 0; i < templateNameArray.length; i++) {
					LOAFilterItem vFilterItem = queryInfo.getFilterList().add(templateNameArray[i]);		
					if("in".equals(type)){
						for (int j = 0; j < valueArray.length; j++) {
							LOAFilterExpressionItem vFilterValueItem =  vFilterItem.getExpressionList().add();
							if(j == 0)
								vFilterValueItem.IsAnd = true;
							else
								vFilterValueItem.IsAnd = false;
							vFilterValueItem.Operator = FilterOperator.Equal;
							vFilterValueItem.Value 	= valueArray[j];
						}
					}else{
						LOAFilterExpressionItem vFilterValueItem =  vFilterItem.getExpressionList().add();
						vFilterValueItem.IsAnd = true;
						vFilterValueItem.Operator = FilterOperator.Equal;
						vFilterValueItem.Value 	= valueArray[i];
					}
				}
				vObjList = vApp.getFormList(tableName, queryInfo);
				List<Map> idList = new Gson().fromJson(vObjList.saveToJson().toString(), 
						new TypeToken<List<Map>>(){}.getType());
				
				for(Map item : idList){
					String objectId = item.get("objectId").toString();
					result = delete(tableName, objectId.substring(0,objectId.lastIndexOf(".")));
				}
			} catch (Exception e) {
				// TODO 自动生成的 catch 块
				System.out.println(e.getMessage());
			}
			return result;
		}
	
	
	//生成单据
	public static JSONObject create(String tableName,String json){
		LOAFormDataObject vObj = null;
		JSONObject oJson =new JSONObject();
		int num = autoNumbe(tableName);
		try{
			vObj = vApp.newFormDataObject(tableName);
			
			vObj.addRawValue("编号",num);
			Gson gson = new Gson();
			Map<String, ?> dto= gson.fromJson(json, HashMap.class);
			for (Entry<String, ?> entry: dto.entrySet()) {
	            String role = entry.getKey();
	            String value =  entry.getValue().toString();
	            if(!"".equals(value))
	            	if("订单号".equals(role)){
	            		vObj.addRawValue(role,value.concat(Integer.toString(num)));
	            		oJson.put("订单号", value.concat(Integer.toString(num)));
	            	}else if("总价".equals(role)){
	            		oJson.put("total", value);
	            		vObj.addRawValue(role,value);
	            	}else
	            		vObj.addRawValue(role,value);
			}
			vObj.save();
			oJson.put("id", num);
			oJson.put("objectId", vObj.getObjectID());
			System.out.println("***"+oJson);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}
		return oJson;
	}
	
	
	//云表接口调用
	public static JSONObject queryInterface(String tableName,String functionName,String value) {
		LOAFormList vObjList = null;
		JSONObject jObj = null;
		try {
			checkLogin();
			
			LOAQueryInfo queryInfo = vApp.createQueryInfo();
			queryInfo.getPageInfo().SetToLoadAllConfig();
			LOAParamValueList paramManager = queryInfo.getParamValueList();

			// 创建查询对象的过滤项（对一个查询对象，可以添加多个数据项的查询）
			paramManager.add("value",value);

			//paramManager.add("value",value);
			vObjList = vApp.query(tableName,functionName ,queryInfo);
			if(vObjList.getCount()>0)
				jObj = change(vApp,vObjList.saveToJson());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}
		return jObj;
	}
	
	/*
	 * 
	 * 
	 * 暂不可用
	 * 
	 * 
	 * 
	 * 
	 * */
	//通过objectId查询表数据
	public static void qeuryByObjectId(String tableName,String objectId){
		LOAFormDataObject vObj = null;
		String result = "false";

		try{
			checkLogin();
			
			vObj = vApp.getFormDataObject(tableName, objectId);
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
			//e.printStackTrace();
		}
		//return change(vApp,vObj);//无法转换LOAFormDataObject类型
	}
	
	//通过条件查询
	public static JSONObject query(String tableName,String templateName,String value,String type) {
		LOAFormList vObjList = null;
		JSONObject jObj = null;
		try {
			checkLogin();

			LOAQueryInfo queryInfo = vApp.createQueryInfo();
			// 创建查询对象的过滤项（对一个查询对象，可以添加多个数据项的查询）
			String[] templateNameArray = templateName.split(",");
			String[] valueArray = value.split(",");
			
			for (int i = 0; i < templateNameArray.length; i++) {
				LOAFilterItem vFilterItem = queryInfo.getFilterList().add(templateNameArray[i]);		
				if("in".equals(type)){
					for (int j = 0; j < valueArray.length; j++) {
						LOAFilterExpressionItem vFilterValueItem =  vFilterItem.getExpressionList().add();
						if(j == 0)
							vFilterValueItem.IsAnd = true;
						else
							vFilterValueItem.IsAnd = false;
						vFilterValueItem.Operator = FilterOperator.Equal;
						vFilterValueItem.Value 	= valueArray[j];
					}
				}else{
					LOAFilterExpressionItem vFilterValueItem =  vFilterItem.getExpressionList().add();
					vFilterValueItem.IsAnd = true;
					vFilterValueItem.Operator = FilterOperator.Equal;
					vFilterValueItem.Value 	= valueArray[i];
				}
			}
			vObjList = vApp.getFormList(tableName, queryInfo);
			if(vObjList.getCount()>0)
				jObj = change(vApp,vObjList.saveToJson());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}
		return jObj;
	}
	
	//查询表
	public static JSONObject load(String tableName){
		LOAFormList list = null;
		JSONObject jObj = null;
		try {
			checkLogin();
			list = vApp.getFormList(tableName);
			if(list.getCount()>0)
				jObj = change(vApp,list.saveToJson());
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			System.out.println(e.getMessage());
		}
		return jObj;
	}

	//wex5 json格式转换
	public static JSONObject change(LOAApp vApp, Object obj) {
 		JSONObject json =new JSONObject();
 		Set nameArray = null; //表字段名集合
 		Collection valueArray = null; //表字段值名集合
 		String stringArray = "String";  ////表字段值类型集合
        try {
			//LOAFormList list = vApp.getFormList(tableName);
			Gson gson = new Gson(); 
			List<Map> idList = new Gson().fromJson(obj.toString(), 
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