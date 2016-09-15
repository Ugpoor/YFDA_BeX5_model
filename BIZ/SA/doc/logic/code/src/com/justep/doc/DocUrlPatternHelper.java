package com.justep.doc;

import java.util.HashMap;
import java.util.Map;

import com.justep.util.Utils;

public class DocUrlPatternHelper {
	public static String getUrlPattern(String urlType,Map<String,String> params){
		if(urlType.equals(UrlPattern.view.name()) || urlType.equals(UrlPattern.download.name()) || urlType.equals(UrlPattern.publicFileView.name())){
			return String.format(urlParttenMap.get(urlType), params.get("fileID"),params.get("versionID"),params.get("partType"));
		}else if(urlType.equals(UrlPattern.officeUploadResultInfo.name())){
			return String.format(urlParttenMap.get(urlType), params.get("resultID"));
		}else{
			return urlParttenMap.get(urlType);
		}
	}
	
	public static String viewPattern(String fileID,String version,String partType){
		version = Utils.isEmptyString(version) ? DocVersion.last.toString(): version;
		partType = Utils.isEmptyString(partType) ? PartType.content.toString() : partType;
		return String.format(UrlPattern.view.toString(),fileID,version,partType);
	}
	
	public static String viewPattern(String fileID){
		return String.format(UrlPattern.view.toString(), fileID,DocVersion.last,PartType.content);
	}
	
	
	public static String downloadPattern(String fileID,String version,String partType){
		version = Utils.isEmptyString(version) ? DocVersion.last.toString(): version;
		partType = Utils.isEmptyString(partType) ? PartType.content.toString() : partType;
		return String.format(UrlPattern.download.toString(), fileID,version,partType);
	}
	
	public static String downloadPattern(String fileID){
		return String.format(UrlPattern.download.toString(), fileID,DocVersion.last,PartType.content);
	}

	public static String deletePattern(){
		return UrlPattern.delete.toString();
	}
	
	public static String officeUploadResultInfoPattern(String resultID){
		return String.format(UrlPattern.officeUploadResultInfo.toString(),resultID);
	}
	
	public static String officeUploadPattern(){
		return UrlPattern.officeUpload.toString();
	}
	
	public static String officeDownloadPattern(){
		return UrlPattern.officeDownload.toString();
	}
	
	public static String cacheUploadPattern(){
		return UrlPattern.cacheUpload.toString();
	}
	
	public static String cacheCommitPattern(){
		return UrlPattern.cacheCommit.toString();
	}
	
	public static String docQueryPattern(){
		return UrlPattern.docQuery.toString();
	}
	
	/*public static boolean isViewPattern(String urlPattern){
		return urlPattern.contains(UrlPattern.viewPattern.toString());
	}
	
	public static String toPublicViewPattern(String urlPattern){
		return urlPattern.replace(UrlPattern.viewPattern.toString(), UrlPattern.publicFileViewPattern.toString());
	}*/
	
	static Map<String,String> urlParttenMap = new HashMap<String,String>();
	
	static {
		urlParttenMap.put(UrlPattern.view.name(), UrlPattern.view.toString());
		urlParttenMap.put(UrlPattern.download.name(), UrlPattern.download.toString());
		urlParttenMap.put(UrlPattern.delete.name(), UrlPattern.delete.toString());
		urlParttenMap.put(UrlPattern.officeUploadResultInfo.name(), UrlPattern.officeUploadResultInfo.toString());
		urlParttenMap.put(UrlPattern.officeUpload.name(), UrlPattern.officeUpload.toString());
		urlParttenMap.put(UrlPattern.officeDownload.name(), UrlPattern.officeDownload.toString());
		urlParttenMap.put(UrlPattern.cacheUpload.name(), UrlPattern.cacheUpload.toString());
		urlParttenMap.put(UrlPattern.cacheCommit.name(), UrlPattern.cacheCommit.toString());
		urlParttenMap.put(UrlPattern.docQuery.name(), UrlPattern.docQuery.toString());
	}
	
	public enum UrlPattern {
		viewPattern("/repository/file/view"),
		view("/repository/file/view/%s/%s/%s"),
		publicFileViewPattern("/repository/publicFile/view"),
		publicFileView("/repository/publicFile/view/%s/%s/%s"),
		downloadPattern("/repository/file/download"),
		download("/repository/file/download/%s/%s/%s"),
		delete("/repository/file/delete"),
		officeUploadResultInfo("/repository/resultInfo/%s"),
		officeUpload("/repository/file/cache/office/upload"), 
		officeDownload("/repository/file/cache/office/download") ,
		cacheUpload("/repository/file/cache/upload") ,
		cacheCommit("/repository/file/cache/commit"),
		docQuery("/repository/file/query");

	    private final String urlPattern;

	    UrlPattern(String urlPattern){
	        this.urlPattern = urlPattern;
	    }
	    
	    public String toString(){
	    	return this.urlPattern;
	    }
	}
	
	public static enum PartType {
		content("content"),
		revision("revision"),
		comment("comment");
		
		private final String typeName;
		
		private PartType(String typeName){
			this.typeName = typeName;
		}
		
		public String toString(){
			return this.typeName;
		}
	}
	
	private static enum DocVersion {
		last("last");
		
		private String versionStr;
		
		private DocVersion(String versionStr){
			this.versionStr = versionStr;
		}
		
		public String toString(){
			return this.versionStr;
		}
	}
	
}
