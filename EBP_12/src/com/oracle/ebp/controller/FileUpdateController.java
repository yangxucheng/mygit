package com.oracle.ebp.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
 
import javax.servlet.http.HttpServletRequest;
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class FileUpdateController {
	 
	 
	@RequestMapping(value="/admin/update.action")
	public String fileUpload(@RequestParam("file") MultipartFile file,HttpServletRequest request){
		System.out.println("asdasd");
		if(!file.isEmpty()){
			System.out.println("size="+file.getSize());
			try{
				String filePath=file.getOriginalFilename();
				file.transferTo(new File("C:/Users/Administr ator/Desktop/EBP_12/WebContent/images/"+filePath));
				 
				File file2=new File(filePath);
				//readFile(file2);
				return "admin/NewFile";
			}catch (Exception e) {
				e.printStackTrace();
				return "admin/NewFile";
			}
		}else{
			System.out.println("读入的文件为null");
			return "admin/NewFile";
		}
	}
	@RequestMapping(value="/admin/request.action")
	public void test(HttpServletRequest request){
		System.out.println(request.getAttribute("list"));
	}
	
	
	public void readFile(File file){
		FileReader fr=null;
		BufferedReader br=null;
		try {
			fr=new FileReader(file);
			br=new BufferedReader(fr);
			String line=br.readLine();
			while(line!=null){
				System.out.println(line);
				line=br.readLine();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(fr!=null){
				try {
					fr.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if(br!=null){
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
	
}
