package com.Helper;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

//This FileUpload Function used To upload File At Cloudinary
@Service
public class FileUploadHelper {

	@Autowired
	private Cloudinary cloudinary;

	@Async
	public String uploadFile(MultipartFile File) {
		try {
			Map uploadResult = cloudinary.uploader().upload(File.getBytes(),
					ObjectUtils.asMap("resource_type", "auto", "public_id", File.getOriginalFilename()));
			return uploadResult.get("url").toString();

		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

}
