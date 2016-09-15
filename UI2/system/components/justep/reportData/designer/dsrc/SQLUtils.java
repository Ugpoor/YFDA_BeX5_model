import java.awt.Font;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.eclipse.swt.custom.StyleRange;
import org.eclipse.swt.custom.StyledText;
import org.eclipse.swt.graphics.Color;

public class SQLUtils {

	public static void highLight(StyledText text,int start,int length) {
		String txt = text.getText();
		Pattern pattern = Pattern.compile("\\b(SELECT|FROM|OPTIONAL|JOIN|ON|WHERE|LIKE|IN|IS|NULL|NOT|NULL|AND|OR|ORDER|BY|ASC|DESC|AS|GROUP|HAVING|select|from|optional|join|on|where|like|in|is|null|not|null|and|or|order|by|asc|desc|as|group|having|DROP|drop|CREATE|create|PRIMARY|KEY|primary|key|ALTER|alter|MODIFY|modify|TABLE|table|COLUMN|column|ADD|add|RENAME|rename|TO|to|INSERT|insert|INTO|into)\\b");
		Matcher matcher = pattern.matcher(txt);
		Color blue = new Color(text.getDisplay(),127,0,85);
		List<StyleRange> rangeList = new ArrayList<StyleRange>();
		while (matcher.find()) {
			StyleRange style1 = new StyleRange();
			rangeList.add(style1);
			style1.start = matcher.start(1);
			style1.length = matcher.end(1)-matcher.start(1);
			style1.fontStyle = Font.BOLD;
			style1.foreground = blue;
		}
		StyleRange[] ranges = new StyleRange[rangeList.size()];
		rangeList.toArray(ranges);
		text.setStyleRanges(ranges);
	}
	
	public static String format(String str){
		if(str.trim().equals("")){
			return str;
		}
		str = str.trim().replaceAll("\\s+", " ");
		Pattern pattern = Pattern.compile("\\b(SELECT|select|FROM|from|JOIN|join|WHERE|where|HAVING|having|ORDER|order|GROUP|group)\\b");
		Matcher matcher = pattern.matcher(str);
		StringBuffer sbf = new StringBuffer(str);
		int addCount=0;
		boolean hasselect = false;
		boolean hasfrom = false;
		boolean haswhere =false;
		boolean hasorder =false; 
		while (matcher.find()) {
			String word = matcher.group().trim();
			if(word.equals("select")){
				if(hasselect){
					continue;
				}
				hasselect = true;
			}else if(word.equals("from")){
				if(hasfrom){
					continue;
				}
				hasfrom = true;
			}else if(word.equals("where")){
				if(haswhere){
					continue;
				}
				haswhere = true;
			}else if(word.equals("order")){
				if(hasorder){
					continue;
				}
				hasorder = true;
			}
			int start =  matcher.start(1);
			if(start==0){
				continue;
			}
			
			sbf.insert(start+addCount, "\n    ");
			addCount+=5;
//			str = str.substring(0, start)+"\n    "+str.substring(start,str.length());
		}
		return sbf.toString();
	}
	
}
