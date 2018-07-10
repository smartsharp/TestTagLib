package org.smartsharp.testtaglib;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

public class PermissionUtil {

    public static final int PERMISSIONS_CODE = 1;

    public static boolean isGrantExternalStoragePermission(Context context) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && context.checkSelfPermission(
                Manifest.permission.WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {
            return false;
        }

        return true;
    }

    public static void reqestExternalStoragePermission(Activity activity){
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M){
            activity.requestPermissions(new String[]{
                    Manifest.permission.READ_EXTERNAL_STORAGE,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE,
            }, PERMISSIONS_CODE);
        }
    }
}
