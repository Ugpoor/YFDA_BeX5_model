import com.justep.system.util.BizUtils;


public class DataFn {

	public static int nextSeq(String key) {
		return BizUtils.getNextSequence(key);
	}
	
	public static String nextSeqString(String key, String format) {
		return BizUtils.createNextSequenceString(key, format);
	}
	
	public static int tempNextSeq(String key) {
		return  BizUtils.getCurrentSequence(key) + 1;

	}
	public static String tempNextSeqString(String key, String format) {
		return BizUtils.createTempNextSeqenceString(key, format);
	}
	
	public static String normalizeKey(Object... values) {
		return BizUtils.normalizeKey(values);
	}

	public static Object relationValue(String concept, String id, String condition, String orderRelation, String returnRelation, String dataModel) {
		return BizUtils.getRelationValue(concept, id, condition, orderRelation, returnRelation, dataModel);
	}

	public static Object relationValues(String concept, String id, String condition, String orderRelation, String returnRelation, String dataModel) {
		return BizUtils.getRelationValues(concept, id, condition, orderRelation, returnRelation, dataModel);
	}

	public static String createSerialNumberByCurrentDate() {
		String current = new java.text.SimpleDateFormat("yyyyMMdd", java.util.Locale.ENGLISH).format((new java.util.Date()));
		return BizUtils.createNextSequenceString(current, "00000");
	}
	
	public static String createSerialNumber(String key, String keyFormat, String dateFormat, String separator){
		return BizUtils.createSerialNumber(key, keyFormat, dateFormat, separator);
	}

	public static String createTmpSerialNumber(String key, String keyFormat, String dateFormat, String separator){
		return BizUtils.createTmpSerialNumber(key, keyFormat, dateFormat, separator);
	}

	public static void main(String[] args){
		System.out.println(createSerialNumber("ORDER", "000", "yyyyMMdd", "-"));
		System.out.println(createSerialNumber("ORDER", "000", "yyyyMMdd", "-"));
		System.out.println(createSerialNumber("ORDER", "000", "yyyyMMdd", "-"));
		System.out.println(createSerialNumber("ORDER", "000", "yyyyMMdd", "-"));
	}
	
	
	
}
