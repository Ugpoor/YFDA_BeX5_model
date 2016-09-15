package demo;

import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.justep.system.transform.JSONSerialization;
import com.justep.system.transform.TransformConfig;
import com.justep.system.transform.XMLSerialization;


public class DemoObject implements XMLSerialization, JSONSerialization {
	private String name;
	private String sex;
	private int age;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public void readerFromJson(Object content, TransformConfig config) {
		JSONObject json = (JSONObject) content;
		try {
			name = json.getString("name");
			sex = json.getString("sex");
			age = json.getInteger("age");
		} catch (JSONException e) {
			throw new RuntimeException("DemoObject转换失败！\n" + content.toString(), e);
		}
	}

	public Object writerToJson(TransformConfig config) {
		JSONObject json = new JSONObject();
		try {
			json.put("name", name);
			json.put("sex", sex);
			json.put("age", age);
		} catch (JSONException e) {
			throw new RuntimeException("DemoObject序列化失败！", e);
		}
		return json;
	}

	public void reader(Element element, TransformConfig config) {
		name = element.attributeValue("name");
		sex = element.attributeValue("sex");
		age = element.attributeValue("age") == null ? null : Integer.parseInt(element.attributeValue("age"));
	}

	public Element writer(TransformConfig config) {
		Element element = DocumentHelper.createElement("DemoObject");
		element.addAttribute("name", name);
		element.addAttribute("sex", sex);
		element.addAttribute("age", String.valueOf(age));
		return element;
	}

	@Override
	public String toString() {
		return writerToJson(null).toString();
	}
	
}