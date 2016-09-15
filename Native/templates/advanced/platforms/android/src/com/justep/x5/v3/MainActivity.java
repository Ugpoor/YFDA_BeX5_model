/*
       Licensed to the Apache Software Foundation (ASF) under one
       or more contributor license agreements.  See the NOTICE file
       distributed with this work for additional information
       regarding copyright ownership.  The ASF licenses this file
       to you under the Apache License, Version 2.0 (the
       "License"); you may not use this file except in compliance
       with the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing,
       software distributed under the License is distributed on an
       "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
       KIND, either express or implied.  See the License for the
       specific language governing permissions and limitations
       under the License.
 */

package com.justep.x5.v3;

import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Environment;
import android.preference.PreferenceManager;

import org.apache.cordova.*;

import java.io.File;

public class MainActivity extends CordovaActivity {

    private void createPicturesDir() {
        File storageDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES);
        storageDir.mkdirs();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        super.init();
        // Crosswalk bug, Pictures目录可能不存在，导致闪退，这里新建一下
        createPicturesDir();

        //动态设置启动页面
        String versionName = "5.3.0";
        try {
            PackageManager packageManager = this.getPackageManager();
            versionName = packageManager.getPackageInfo(this.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }

        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(this);
        String indexPageKey = "indexPage_" + versionName;
        if (sharedPrefs.contains(indexPageKey)) {
            Object obj = sharedPrefs.getAll().get(indexPageKey);
            loadUrl(obj.toString());
        } else {
            loadUrl(Config.getStartUrl());
        }
    }
}
