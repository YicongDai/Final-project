package shop;

import java.util.ArrayList;

public class GoodBean {
	public static String getSid() {
		return sid;
	}

	public static void setSid(String sid) {
		GoodBean.sid = sid;
	}

	static String sid;
	static String sname;
//String description;
//ArrayList<String> temp= new ArrayList<String>();
//public String getDescription(String sid) {
//	int index= Integer.parseInt(sid);
//	description=temp.get(index);
//	return description;
//}
//
//public void setDescription(String sid,String description) {
//	int index= Integer.parseInt(sid);
//	this.description = description;
//	temp.add(index, description);
//}

	public static String getSname() {
		return sname;
	}

	public static void setSname(String sname) {
		GoodBean.sname = sname;
	}

	public static String getSprice() {
		return sprice;
	}

	public static void setSprice(String sprice) {
		GoodBean.sprice = sprice;
	}

	static String sprice;

}
