package com.medical.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class saveFileHelper {

	
	//delete file according to the path
		public static boolean deleteFile(String path) {
			
			boolean isFalse = false;
			
			
			try {
				
				File file = new File(path);
				isFalse = file.delete();
				
				
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			
			
			return isFalse;
			
		}
		
		//save file
		public static boolean saveFile(InputStream is, String path) {
			
			boolean isTrue = false;
			
			try {
				
				byte data[] = new byte[is.available()];
				
				is.read(data);
				
				FileOutputStream fos = new FileOutputStream(path);
				
				fos.write(data);
				
				fos.flush();
				fos.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return isTrue;
			
		}

	
	
}
