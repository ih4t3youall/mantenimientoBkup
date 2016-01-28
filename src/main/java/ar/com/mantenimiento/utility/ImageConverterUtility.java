package ar.com.mantenimiento.utility;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Base64;

import javax.imageio.ImageIO;

public  class ImageConverterUtility {

	
	
	
	public static String convertImage(String url) throws IOException{
		File sourceimage = new File(url);
		BufferedImage image = ImageIO.read(sourceimage);

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(image, "jpg", baos);
		byte[] encode = Base64.getEncoder().encode(baos.toByteArray());
		return new String(encode, "UTF-8");
			
			
		
		
		
	}
	
	
	
}
