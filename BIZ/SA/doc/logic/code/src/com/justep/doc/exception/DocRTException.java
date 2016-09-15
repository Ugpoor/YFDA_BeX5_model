package com.justep.doc.exception;

import java.util.List;

import com.justep.exception.BaseRuntimeException;
import com.justep.message.DocMessages;

public class DocRTException extends BaseRuntimeException{

	private static final long serialVersionUID = 368123379475140395L;
	
	
	private static final Class<?> msgClass = DocMessages.class;
	
	public DocRTException() {
		super();
	}

	public DocRTException(String message) {
		super(msgClass, message);
	}

	public DocRTException(String message, Throwable cause) {
		super(msgClass,message);
	}
	
	public DocRTException(String message, List<Object> params,Throwable cause) {
		super(msgClass,message,params,cause);
	}
	
	public DocRTException(String message, List<Object> params) {
		super(msgClass,message,params);
	}
	
	public DocRTException(Throwable cause) {
		super(cause);
	}
	
}
