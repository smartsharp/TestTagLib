package org.smartsharp.testtaglib;

import android.Manifest;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import org.smartsharp.taglib.TagLibUtil;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    private Button btnTest1;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        btnTest1 = (Button)findViewById(R.id.btnTest1);
        btnTest1.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        if(!PermissionUtil.isGrantExternalStoragePermission(this)){
            PermissionUtil.reqestExternalStoragePermission(this);
            return;
        }
        new Thread(new Runnable() {
            @Override
            public void run() {
                String filepath = "/sdcard/test/7.aac";
                long t1 = System.currentTimeMillis();
                final boolean b = TagLibUtil.setTag(filepath, "COMMENT", "hello", "helloworld", true);
                //final String b = TagLibUtil.getTag(filepath, "COMMENT" ,true);
                final long duration = System.currentTimeMillis()-t1;
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        Toast.makeText(MainActivity.this, "setTag="+b+",duration="+duration, Toast.LENGTH_SHORT).show();
                    }
                });
            }
        }).start();
    }
}
