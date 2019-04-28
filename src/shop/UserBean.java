package shop;

import java.util.Map;
import java.util.Vector;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

public class UserBean {

	static int span = 5; // 5 rows

	// get all uid
	public static String[] getUser_uid() {
		String[] User_uid_temporary = new String[100];
		// connect User
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library"); // library
		DBCollection coll = db.getCollection("userInfo"); // User
		DBCursor cursor = coll.find();

		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();

			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String touid = (String) show1.get("uid"); // uid
			User_uid_temporary[i] = touid;
			i++;
		}
		String[] User_uid = new String[i];
		for (int j = 0; j < i; j++) {
			User_uid[j] = User_uid_temporary[j];
		}

		return User_uid;
	}

	// sname
	public static String[] getUser_name() {
		String[] User_sname_temporary = new String[100];

		MongoClient mongoClient = new MongoClient("localhost", 27017);

		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();

		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String tosname = (String) show1.get("username");
			User_sname_temporary[i] = tosname;
			i++;
		}
		String[] User_sname = new String[i];
		for (int j = 0; j < i; j++) {
			User_sname[j] = User_sname_temporary[j];
		}
		return User_sname;
	}

	// sprice
	public static String[] getUser_password() {
		String[] User_password_temporary = new String[100];

		MongoClient mongoClient = new MongoClient("localhost", 27017);

		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();

		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String topassword = (String) show1.get("password");
			User_password_temporary[i] = topassword;
			i++;
		}
		String[] User_password = new String[i];
		for (int j = 0; j < i; j++) {
			User_password[j] = User_password_temporary[j];
		}
		return User_password;
	}

	// seller
	public static String[] getUser_email() {
		String[] User_email_temporary = new String[100];

		MongoClient mongoClient = new MongoClient("localhost", 27017);

		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();

		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap(); //
			String toemail = (String) show1.get("email");
			User_email_temporary[i] = toemail;
			i++;
		}
		String[] User_email = new String[i];
		for (int j = 0; j < i; j++) {
			User_email[j] = User_email_temporary[j];
		}
		return User_email;
	}

	// des
	public static String[] getUser_address() {
		String[] User_address_temporary = new String[100];

		MongoClient mongoClient = new MongoClient("localhost", 27017);

		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();

		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String toaddress = (String) show1.get("address");
			User_address_temporary[i] = toaddress;
			i++;
		}
		String[] User_address = new String[i];
		for (int j = 0; j < i; j++) {
			User_address[j] = User_address_temporary[j];
		}
		return User_address;
	}

	// catalog
	public static String[] getUser_phoneNum() {
		String[] User_phoneNum_temporary = new String[100];

		MongoClient mongoClient = new MongoClient("localhost", 27017);

		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();
		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String tophoneNum = (String) show1.get("phone_number");
			User_phoneNum_temporary[i] = tophoneNum;
			i++;
		}
		String[] User_phoneNum = new String[i];
		for (int j = 0; j < i; j++) {
			User_phoneNum[j] = User_phoneNum_temporary[j];
		}
		return User_phoneNum;
	}

	// return information of current page
	public static String[][] getUserList(int page) {
		String[][] result = null;
		Vector<String[]> v = new Vector<String[]>();
		String[] User_uid = getUser_uid();
		String[] User_name = getUser_name();
		String[] User_password = getUser_password();
		String[] User_email = getUser_email();
		String[] User_address = getUser_address();
		String[] User_phoneNum = getUser_phoneNum();
		int len = User_uid.length;
		for (int i = 0; i < span; i++) {
			int t = (page - 1) * span + i;
			if (t >= len) {

				break;
			}

			String[] User_temp = new String[6];
			User_temp[0] = User_uid[t];
			User_temp[1] = User_name[t];
			User_temp[2] = User_password[t];
			User_temp[3] = User_email[t];
			User_temp[4] = User_address[t];
			User_temp[5] = User_phoneNum[t];
			v.add(User_temp);

		}

		int size = v.size();
		result = new String[size][];
		for (int j = 0; j < size; j++) {

			result[j] = (String[]) v.elementAt(j);
		}

		return result;
	}

	// get username by id
	public static String getUserName(String uid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();
		String username = "";
		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String touid = (String) show1.get("uid");
			if (touid.equals(uid)) {
				username = (String) show1.get("username");
			}

			i++;
		}
		return username;
	}

	// get email by id
	public static String getEmail(String uid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();
		String email = "";
		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String touid = (String) show1.get("uid");
			if (touid.equals(uid)) {
				email = (String) show1.get("email");
			}

			i++;
		}
		return email;
	}

	// get address by id
	public static String getAddress(String uid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();
		String address = "";
		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String touid = (String) show1.get("uid");
			if (touid.equals(uid)) {
				address = (String) show1.get("address");
			}

			i++;
		}
		return address;
	}

	// get password by id
	public static String getPassWord(String uid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();
		String password = "";
		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String touid = (String) show1.get("uid");
			if (touid.equals(uid)) {
				password = (String) show1.get("password");
			}

			i++;
		}
		return password;
	}

//get phone number by id
	public static String getPhoneNum(String uid) {
		MongoClient mongoClient = new MongoClient("localhost", 27017);
		@SuppressWarnings("deprecation")
		DB db = mongoClient.getDB("library");
		DBCollection coll = db.getCollection("userInfo");
		DBCursor cursor = coll.find();
		String PhoneNum = "";
		int i = 0;
		while (cursor.hasNext()) {
			DBObject show = cursor.next();
			System.out.println(show);
			@SuppressWarnings("rawtypes")
			Map show1 = show.toMap();
			String touid = (String) show1.get("uid");
			if (touid.equals(uid)) {
				PhoneNum = (String) show1.get("phone_number");
			}

			i++;
		}
		return PhoneNum;
	}

	// return all
	public static String[] getDetail(String uid) {
		String[] User_detail = null;
		User_detail = new String[5];
		String[] User_name = getUser_name();
		String[] User_password = getUser_password();
		String[] User_email = getUser_email();
		String[] User_address = getUser_address();
		String[] User_phoneNum = getUser_phoneNum();
		int i = Integer.parseInt(uid);
		User_detail[0] = User_name[i];
		User_detail[1] = User_password[i];
		User_detail[2] = User_email[i];
		User_detail[3] = User_address[i];
		User_detail[4] = User_phoneNum[i];
		return User_detail;
	}

	// return page
	public static int getTotalPage() {
		int page = 0;
		String[] User_uid = getUser_uid();
		int len = User_uid.length;
		page = len / span + ((len % span == 0) ? 0 : 1);

		return page;
	}

	public static int getlength(String[][] a) {
		return a.length;
	}

	public static void main(String args[]) {
//

		System.out.println("test:" + UserBean.getTotalPage());
		String[][] ss = UserBean.getUserList(UserBean.getTotalPage());
		for (int i = 0; i < ss.length; i++) {
			System.out.println(ss[i][0]);
			System.out.println(ss[i][1]);
			System.out.println(ss[i][2]);
		}
		int n = ss.length;
		System.out.println("length:" + n);

	}

}
