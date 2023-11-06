package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.itbank.model.CampingDTO;
import com.itbank.service.CampingService;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	@Autowired private CampingService campingService;

	@GetMapping("/selectOption")
	public List<CampingDTO> selectOption(String selectValue) throws JsonProcessingException {
		List<CampingDTO> list = campingService.selectOption(selectValue);
		return list;
	}
	
}
