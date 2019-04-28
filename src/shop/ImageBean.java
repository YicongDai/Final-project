package shop;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;

import java.io.File;
import java.io.IOException;
import java.net.UnknownHostException;

public class ImageBean {
	public static void saveImage(String name, String path) {
		try {

			MongoClient mongoClient = new MongoClient("localhost", 27017);
			DB db = mongoClient.getDB("library");

			String newFileName = name;

			File imageFile = new File(path);

			// create a "photo" namespace
			GridFS gfsPhoto = new GridFS(db, "photo");

			// get image file from local drive
			GridFSInputFile gfsFile = gfsPhoto.createFile(imageFile);

			// set a new filename for identify purpose
			gfsFile.setFilename(newFileName);

			// save the image file into mongoDB
			gfsFile.save();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (MongoException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String getImage(String Name) {
		try {
			MongoClient mongoClient = new MongoClient("localhost", 27017);
			DB db = mongoClient.getDB("library");
			// create a "photo" namespace
			GridFS gfsPhoto = new GridFS(db, "photo");
			// print the result

			DBCursor cursor = gfsPhoto.getFileList();
			while (cursor.hasNext()) {
				System.out.println(cursor.next());
			}

			// get image file by it's filename
			GridFSDBFile imageForOutput = gfsPhoto.findOne(Name);

			// save it into a new image file
			imageForOutput.writeTo("D://" + Name + "-from-db.jpg");
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (MongoException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "D://" + Name + "-from-db.jpg";
	}

	public static void removeImage(String Name) {
		try {
			MongoClient mongoClient = new MongoClient("localhost", 27017);
			DB db = mongoClient.getDB("library");
			// create a "photo" namespace
			GridFS gfsPhoto = new GridFS(db, "photo");
			// remove the image file from mongoDB

			gfsPhoto.remove(gfsPhoto.findOne(Name));

			System.out.println("Done");

		} catch (MongoException e) {
			e.printStackTrace();
		}

	}

	public static void main(String[] args) {
//    	       saveImage("mkyong-java-image","WebContent/image/upload/1.jpg");
//    	       getImage("mkyong-java-image");
//           removeImage("mkyong-java-image");
//       

	}
}