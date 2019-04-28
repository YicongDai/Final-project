package shop;

import java.util.Map;
import java.util.Vector;

import com.mongodb.*;

public class MongodbBean {

	static int span = 5; // 5 rows

	// get all sid
	public static String[] getGood_sid() {
		String[] good_sid_temporary = new String[100]; 
		//connect mongodb
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); // library
		DBCollection coll = db.getCollection("good"); // good
		DBCursor cursor = coll.find(); 

		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();

			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String tosid = (String) show1.get("sid"); //sid
			good_sid_temporary[i] = tosid; 
			i++;
		}
		String[] good_sid = new String[i]; 
		for (int j = 0; j < i; j++) {
			good_sid[j] = good_sid_temporary[j];
		}

		return good_sid;
	}

	// sname
	public static String[] getGood_sname() {
		String[] good_sname_temporary = new String[100]; 
		
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good"); 
		DBCursor cursor = coll.find();

		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String tosname = (String) show1.get("sname"); 
			good_sname_temporary[i] = tosname; 
			i++;
		}
		String[] good_sname = new String[i]; 
		for (int j = 0; j < i; j++) {
			good_sname[j] = good_sname_temporary[j];
		}
		return good_sname;
	}

	// sprice
	public static String[] getGood_sprice() {
		String[] good_sprice_temporary = new String[100]; 
		
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good"); 
		DBCursor cursor = coll.find(); 

		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String tosprice = (String) show1.get("sprice"); 
			good_sprice_temporary[i] = tosprice; 
			i++;
		}
		String[] good_sprice = new String[i]; 
		for (int j = 0; j < i; j++) {
			good_sprice[j] = good_sprice_temporary[j];
		}
		return good_sprice;
	}

	// seller
	public static String[] getGood_seller() {
		String[] good_seller_temporary = new String[100]; 
		
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good"); 
		DBCursor cursor = coll.find(); 

		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); // 
			String toseller = (String) show1.get("seller"); 
			good_seller_temporary[i] = toseller; 
			i++;
		}
		String[] good_seller = new String[i]; 
		for (int j = 0; j < i; j++) {
			good_seller[j] = good_seller_temporary[j];
		}
		return good_seller;
	}

	// des
	public static String[] getGood_des() {
		String[] good_des_temporary = new String[100]; 
		
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good");
		DBCursor cursor = coll.find(); 

		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String todes = (String) show1.get("description"); 
			good_des_temporary[i] = todes;
			i++;
		}
		String[] good_des = new String[i]; 
		for (int j = 0; j < i; j++) {
			good_des[j] = good_des_temporary[j];
		}
		return good_des;
	}

	// catalog
	public static String[] getGood_catalog() {
		String[] good_catalog_temporary = new String[100]; 
		
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good"); 
		DBCursor cursor = coll.find(); 
		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String tocatalog = (String) show1.get("catalog"); 
			good_catalog_temporary[i] = tocatalog; 
			i++;
		}
		String[] good_catalog = new String[i]; 
		for (int j = 0; j < i; j++) {
			good_catalog[j] = good_catalog_temporary[j];
		}
		return good_catalog;
	}

	// return information of current page
	public static String[][] getGoodList(int page) {
		String[][] result = null;
		Vector<String[]> v = new Vector<String[]>(); 
		String[] good_sid = getGood_sid();  
		String[] good_sname = getGood_sname(); 
		String[] good_sprice = getGood_sprice(); 
		String[] good_catalog = getGood_catalog();
		String[] good_seller = getGood_seller();
		String[] good_des = getGood_des();
		int len = good_sid.length;
		for (int i = 0; i < span; i++) {
			int t = (page - 1) * span + i; 
			if (t >= len) {
				
				break;
			}

			String[] good_temp = new String[6]; 
			good_temp[0] = good_sid[t];
			good_temp[1] = good_sname[t];
			good_temp[2] = good_sprice[t];
			good_temp[3] = good_catalog[t];
			good_temp[4] = good_seller[t];
			good_temp[5] = good_des[t];
			v.add(good_temp); 

		}

		int size = v.size();
		result = new String[size][]; 
		for (int j = 0; j < size; j++) {
			
			result[j] = (String[]) v.elementAt(j);
		}

		return result;
	}

	// get price by id
	public static String getPrice(String sid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good"); 
		DBCursor cursor = coll.find(); 
		String price="";
		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String tosid = (String) show1.get("sid");
			if (tosid.equals(sid)) {
				price=(String) show1.get("sprice");
			}

			i++;
		}
		return price;
	}

	// get name by id
	public static String getName(String sid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good"); 
		DBCursor cursor = coll.find(); 
		String name="";
		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String tosid = (String) show1.get("sid");
			if (tosid.equals(sid)) {
				name=(String) show1.get("sname");
			}

			i++;
		}
		return name;
	}

	//get des by id 
	public static String getDes(String sid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good"); 
		DBCursor cursor = coll.find(); 
		String des="";
		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String tosid = (String) show1.get("sid");
			if (tosid.equals(sid)) {
				des=(String) show1.get("description");
			}

			i++;
		}
		return des;
	}

	//get seller by id
	public static String getSeller(String sid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good"); 
		DBCursor cursor = coll.find(); 
		String seller="";
		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String tosid = (String) show1.get("sid");
			if (tosid.equals(sid)) {
				seller=(String) show1.get("seller");
			}

			i++;
		}
		return seller;
	}
//get catalog by id
	public static String getCatalog(String sid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); 
		DBCollection coll = db.getCollection("good"); 
		DBCursor cursor = coll.find(); 
		String catalog="";
		int i = 0;
		while (cursor.hasNext()) { 
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); 
			String tosid = (String) show1.get("sid");
			if (tosid.equals(sid)) {
				catalog=(String) show1.get("catalog");
			}

			i++;
		}
		return catalog;
	}

	//return all
	public static String[] getDetail(String sid) {
		String[] good_detail = null;
		good_detail = new String[5];
		String[] good_sname = getGood_sname(); 
		String[] good_sprice = getGood_sprice(); 
		String[] good_seller = getGood_seller();
		String[] good_des = getGood_des();
		String[] good_catalog = getGood_catalog();
		int i = Integer.parseInt(sid); 
		good_detail[0] = good_sname[i];
		good_detail[1] = good_sprice[i]; 
		good_detail[2] = good_catalog[i];
		good_detail[3] = good_seller[i];
		good_detail[4] = good_des[i];
		return good_detail;
	}

    //return page
	public static int getTotalPage() {
		int page = 0;
		String[] good_sid = getGood_sid();
		int len = good_sid.length;
		page = len / span + ((len % span == 0) ? 0 : 1); 

		return page;
	}

	
	public static int getlength(String[][] a) {
		return a.length;
	}

	public static void main(String args[]) {
//

		System.out.println("test:" + MongodbBean.getTotalPage());
		String[][] ss = MongodbBean.getGoodList(MongodbBean.getTotalPage());
		for (int i = 0; i < ss.length; i++) {
			System.out.println(ss[i][0]);
			System.out.println(ss[i][1]);
			System.out.println(ss[i][2]);
		}
		int n = ss.length;
		System.out.println("length:" + n);

	}

}
