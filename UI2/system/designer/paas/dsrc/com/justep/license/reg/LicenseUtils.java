package com.justep.license.reg;

import java.sql.Connection;

public class LicenseUtils {
	private static Activation instance;
	
	static {
		instance = new Activation();
	}
	
	public static String licenseActivation(String pkg, String UIP, String CIP, Connection conn){
		return instance.activation(pkg, UIP, CIP, conn);
	}
	
	public static String licenseManualActivation(String pkg, String UIP, String CIP, Connection conn){
		return instance.activation(pkg, UIP, CIP, conn, false);
	}

	public static void licenseActivationOK(String key, Connection conn){
		instance.activationOK(key, conn);
	}
}
