package com.bank.api.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
//@AllArgsConstructor
public class ApiResponse {

	private Boolean success;
	private String message;
	
//private Map<String, String> data = new HashMap<String,String>();
public ApiResponse(Boolean success , String message) {
	this.success = success;
	
	this.message = message;
	
	
}
public Boolean getSuccess() {
	return success;
}
public void setSuccess(Boolean success) {
	this.success = success;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
}
