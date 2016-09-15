import com.justep.client.ClientUtils;


public class ClientFn {
	public static boolean enabledClient(){
		return ClientUtils.enabledClient();
	}
	
	public static String clientName(){
		return ClientUtils.getClientName();
	}
	
	public static String clientValue(){
		return ClientUtils.getClientValue();
	}
	
	public static String clientCode(){
		return ClientUtils.getClientCode();
	}
}
