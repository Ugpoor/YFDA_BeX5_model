package com.justep.excel;

import java.util.List;

import com.justep.exception.BaseRuntimeException;

public class ExcelException extends BaseRuntimeException {
	private static final long serialVersionUID = 7381639715858244832L;
	private static final Class<?> c = ExcelException.class;
		
	private ExcelException(String code, List<Object> params){
		super(c, code, params);
	}
	
	private ExcelException(String code, List<Object> params, Throwable t){
		super(c, code, params, t);
	}

	private ExcelException(Class<?> c, String code, List<Object> params){
		super(c, code, params);
	}
	
	private ExcelException(Class<?> c, String code, List<Object> params, Throwable t){
		super(c, code, params, t);
	}
	
	public static ExcelException create(String code, Object...params){
		return new ExcelException(code, toList(params));
	}
	
	public static ExcelException create(Throwable t, String code, Object...params){
		return new ExcelException(code, toList(params), t);
	}
	
	public static ExcelException create(Class<?> c, String code, Object...params){
		return new ExcelException(c, code, toList(params));
	}
	
	public static ExcelException create(Throwable t, Class<?>c, String code, Object...params){
		return new ExcelException(c, code, toList(params), t);
	}
}
