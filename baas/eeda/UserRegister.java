package eeda;

import java.io.IOException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
import java.util.Random;

import javax.servlet.ServletResponse;


import com.alibaba.fastjson.JSONObject;
import com.justep.baas.action.ActionContext;
import com.justep.baas.data.DataUtils;
public class UserRegister {
	//发送手机验证
	public static JSONObject testPhone(JSONObject params, ActionContext context) throws IOException, Exception{
		String fPhoneNumber = params.getString("fPhoneNumber");
		//生成6位数字的随机字符串
		int suiji = new Random().nextInt(899999) + 100000;
		String backStr = Integer.toString(suiji);
		// 将随机字符串通过jsonOBJ返回前台 
		JSONObject jsonObj = new JSONObject();
		//       System.out.println("backStr==="+backStr);
		jsonObj.put("CheckCode", backStr);
		DataUtils.writeJsonToResponse((ServletResponse)(context.get(ActionContext.RESPONSE)), jsonObj);

		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://gbk.sms.webchinese.cn");
		post.addRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=gbk");
		//在头文件中设置转码
		NameValuePair[] data = { new NameValuePair("Uid", "sky198127"), new NameValuePair("Key", "7b6da72cf462854530fa"),
				new NameValuePair("smsMob", fPhoneNumber), new NameValuePair("smsText", "验证码：" + backStr + " (本信息由系统自动发出，不要回复)") };

		//这段Java代码是直接从他家demo拷贝下来的，只需要修改这句话，填写你在他家注册的用户名、短信密钥，参数中加要发送的手机号和验证码短信
		post.setRequestBody(data);
		try {
			client.executeMethod(post);
			Header[] headers = post.getResponseHeaders();
			int statusCode = post.getStatusCode();
			System.out.println("状态码:" + statusCode);
			for (Header h : headers) {
				System.out.println(h.toString());
			}
			String result = new String(post.getResponseBodyAsString().getBytes("gbk"));
			System.out.println(result); //打印返回消息状态

		} finally {
			post.releaseConnection();

		}
		return null;
	}
	// 使用common-email, javamail  发送邮箱验证
    public static JSONObject testEmail(JSONObject params, ActionContext context) throws Exception{
    	String useremail=params.getString("emailNumber");
    	//生成6位数字的随机字符串
        int suiji = new Random().nextInt(899999)+100000;
        String backStr=Integer.toString(suiji);
    	Email email = new SimpleEmail();
        email.setHostName("smtp.exmail.qq.com");
        email.setSmtpPort(465);
        email.setAuthenticator(new DefaultAuthenticator("news@eeda123.com", "Eeda123"));
        email.setSSLOnConnect(true);
        email.setFrom("news@eeda123.com");
        email.setSubject("易达物流企业管理平台");
        email.setMsg("邮箱验证码为："+backStr);
        email.addTo(useremail);
        email.send();
        JSONObject jbject =new JSONObject();
        jbject.put("backStr", backStr);
        return jbject;
    }
}
