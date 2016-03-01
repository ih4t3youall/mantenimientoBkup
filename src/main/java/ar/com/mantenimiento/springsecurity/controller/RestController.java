package ar.com.mantenimiento.springsecurity.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ar.com.mantenimiento.entity.Maquina;
import ar.com.mantenimiento.springsecurity.dao.impl.MaquinaDAO;

@Transactional
@Controller
public class RestController {
 
	private static String UPLOAD_LOCATION = "C:/mytemp/pdf";
   
   @Autowired
   private MaquinaDAO maquinaDAO;
   

@RequestMapping(value = "admin/uploadFile", method = RequestMethod.POST)
@ResponseBody
public ResponseEntity<?> uploadFile(@RequestParam("uploadfile") MultipartFile uploadfile,@RequestParam("idMaquina") String idMaquina) {
  
	if(uploadfile.getOriginalFilename().equals("")){
		return new ResponseEntity<>(HttpStatus.OK);
		
	}
	
	
  try {
    // Get the filename and build the local file path (be sure that the 
    // application have write permissions on such directory)
    String filename = uploadfile.getOriginalFilename();
    
    String filepath = Paths.get(UPLOAD_LOCATION, filename).toString();
    
    // Save the file locally
    BufferedOutputStream stream =
        new BufferedOutputStream(new FileOutputStream(new File(filepath)));
    stream.write(uploadfile.getBytes());
    stream.close();
    
    Maquina maquina = maquinaDAO.getByKey(Integer.parseInt(idMaquina));
    maquina.setUrlPdf(filepath);
    maquinaDAO.persist(maquina);
    
    
    
  }
  catch (Exception e) {
    System.out.println(e.getMessage());
    return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
  }
  
  return new ResponseEntity<>(HttpStatus.OK);
} // method uploadFile
   
   


   
 
}