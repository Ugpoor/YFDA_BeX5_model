package com.justep.ui.system.component.common.extendTypeComponent;

public class ExtendTypeDef {
	private String name;
	private String editor;
	
	public ExtendTypeDef(String name, String editor){
		this.editor = editor;
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public String getEditor() {
		return editor;
	}
}
