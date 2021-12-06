### Membuat plugin yang menampilkan informasi sistem android
Buat plugin package dengan `--template=plugin`, gunakan --org untuk menentukan organisasi, menentukan bahasa iOS dengan -i dan bahasa Android dengan -a
```
flutter create --org com.example --template=plugin -a java deviceinfo
```
![version](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-02/kasus/images/versiandroid.PNG)\
`lib\deviceinfo.dart` berisi Dart API untuk plugin\
`android\src\main\java\com\example\deviceinfo\DeviceinfoPlugin.java` sebagai implementasi platform spesifik android dari API plugin\
`ios\Classes\DeviceinfoPlugin.m` sebagai implementasi platform spesifik iOS dari API plugin\
`example\` berisi aplikasi flutter yang bergantung pada plugin\
Masuk ke folder `cd deviceinfo\example` lalu jalankan `flutter run` untuk menjalankan aplikasi atau `flutter build apk` untuk membuat apk. 
Kode platform android berada di `deviceinfo\java\com.example.deviceinfo\DeviceinfoPlugin` pada android studio. 
Contoh file [deviceinfo](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-02/kasus/deviceinfo)\
`main.dart` pada example sebagai UI flutter yang menampilkan info perangkat dengan memanggil method `platformVersion` pada class `Deviceinfo`. 
`deviceinfo.dart` memanggil method channel dengan invokeMethod `getPlatformVersion`. 
import method channel, environment, dll pada DeviceinfoPlugin.java
```
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import android.os.Environment;
```
Gunakan MethodCall untuk mendapatkan info perangkat yang kemudian di return.\
![deviceinfo](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-02/kasus/images/debuginfo.PNG)

Sumber:\
[Develop Package](https://flutter.dev/docs/development/packages-and-plugins/developing-packages)\
[StackOverflow device info](https://stackoverflow.com/questions/3213205/how-to-detect-system-information-like-os-or-device-type)