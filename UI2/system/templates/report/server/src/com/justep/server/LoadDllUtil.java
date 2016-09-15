package com.justep.server;

import com.justep.common.SystemUtils;
import com.justep.filesystem.FileSystem;
import com.justep.filesystem.FileSystemWrapper;

public class LoadDllUtil {

	public static void loadDll() {
		FileSystem fs = FileSystemWrapper.instance();
		String x86Path = fs.getRealPath("/UI2/system/templates/report/server/lib");
		String os = System.getProperty("os.name");
		boolean OS_Windows = os.startsWith("Windows");
		if (OS_Windows) {
			/*
			try {
				addPath(x86Path);
			} catch (IOException e) {
				e.printStackTrace();
			}
			*/
			
			
			
			String libpath = SystemUtils.normalizeLib(x86Path, "jacob-1.14.3");
			System.setProperty("jacob.dll.path", libpath);

		}else{
			throw new RuntimeException("jacob donn't support non-windows");
		}
	}
	
	/*
	private static void addPath(String s) throws IOException {
		try {
			s = s.replace("\\", "/");
			Field field = ClassLoader.class.getDeclaredField("usr_paths");
			field.setAccessible(true);
			String[] paths = (String[]) field.get(null);

			for (int i = 0; i < paths.length; i++) {
				if (s.equals(paths[i])) {
					return;
				}
				String[] tmp = new String[paths.length + 1];
				System.arraycopy(paths, 0, tmp, 0, paths.length);
				tmp[paths.length] = s;
				field.set(null, tmp);
			}
		} catch (IllegalAccessException e) {
			throw new IOException("Failed to get permissions to set library path");
		} catch (NoSuchFieldException e) {
			throw new IOException("Failed to get field handle to set library path");
		}
	}
	*/
}