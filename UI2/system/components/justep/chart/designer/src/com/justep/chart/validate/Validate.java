package com.justep.chart.validate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Validate {

	public static final String VALIDATE_RULE_TYPE_REGEXP = "regexp";  //正则
	
	/**
	 * 验证
	 * @param text     目标字符串
	 * @param ruleType 验证类型
	 * @param ruleStr  验证规则字符串
	 * @return
	 */
	public boolean validate(String text , String ruleType ,String ruleStr){
		if(ruleType.equalsIgnoreCase(VALIDATE_RULE_TYPE_REGEXP)){
			Pattern pattern = Pattern.compile(ruleStr);
			Matcher matcher = pattern.matcher(text);
			if (!matcher.matches()) {
				return false;
			}
		}
		return true;
	}
	

	public static boolean regexpMatcher(String regexpStr ,String value) {
		Pattern pattern = Pattern.compile(regexpStr);
		Matcher matcher = pattern.matcher(value);
		if (!matcher.matches()) {
			return false;
		}
		return true;
	}

	
	public static void main(String [] args){
		String regexpStr = "[1-9]{1}$";
		regexpStr = "^([a-zA-Z_]+[0-9]*,?[a-zA-Z_]+[0-9]*)*$";
		regexpStr = "^(true|false)*$";
		regexpStr = "^[#]{1}[A-Za-z0-9]{6}$";
		
		regexpStr="^[-]?[0-9]+(.[0-9]+)?$";
		regexpStr = "^[A-Za-z_()]+[0-9]*$";
		
		//^(0.[0-9]+|1.0){1}D?$
		//^(0.[0-9]+|1.0){1}f?$
		
		String temp="(xxx)8888";
		boolean b = Validate.regexpMatcher(regexpStr, temp);
		System.out.println(b);
	}
	
}
