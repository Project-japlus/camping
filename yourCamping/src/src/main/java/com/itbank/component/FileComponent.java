package com.itbank.component;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileComponent {

	private String saveDirectory3 = "C:\\upload";
	
	public FileComponent() {
		File dir3 = new File(saveDirectory3);
		if (dir3.exists() == false) {
			dir3.mkdirs();
		}
	}
	
	public String upload3(MultipartFile f) {
		String fileName = UUID.randomUUID().toString().replace("-", "").substring(6);;
		String originalFileName = f.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		fileName += ext;			// 확장자 붙이고
		File dest = new File(saveDirectory3, fileName);
		try {
			f.transferTo(dest);
			return fileName;
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public void deleteFile(String fileName) {
		File dest = new File(saveDirectory3, fileName);
		if (dest.exists()) {
			dest.delete();
		}
	}
}
