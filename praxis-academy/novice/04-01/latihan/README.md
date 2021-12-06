### Platform-specific code
Untuk dukungan platform API khusus, Flutter mengirim pesan ke host (IOS atau Android) melalui channel platform. 
Host mendengarkan pada channel platform dan menerima pesan. Lalu panggil platform API khusus menggunakan bahasa pemrograman native dan kirim respon kembali ke klien (Flutter).\
MethodChannel API (Android) memungkinkan mengirim pesan yang sesuai dengan panggilan method. 
FlutterMethodChannel (API) memungkinkan menerima panggilan method dan mengirim kembali hasilnya.
### Calling platform-specific Android code using platform channels
Buat projek baru batterylevel `flutter create batterylevel`\
Buat Flutter klien
```
class _PlatformChannelState extends State<PlatformChannel> {
  static const method_battery = const MethodChannel('samples.flutter.dev/battery');
  
  String _batteryLevel = 'Unknown battery level.';
  
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await method_battery.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException catch (e) {
      batteryLevel = 'Failed to get battery level: "${e.message}".';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
```
`MethodChannel` sebagai single platform untuk mengembalikan nilai level baterai. 
Future `_getBatteryLevel` untuk mencoba mendapatkan level baterai dengan `invokeMethod`. 
onPressed pada build untuk call `_getBatteryLevel`, dan `Text(_batteryLevel)` untuk menampilkan level baterai.\
Tambahkan Android platform-specific menggunakan Kotlin pada `MainActivity.kt`
```
package com.example.batterylevel

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val CBattery = "samples.flutter.dev/battery"
  
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    GeneratedPluginRegistrant.registerWith(this)
    MethodChannel(flutterView, CBattery).setMethodCallHandler { call, result ->
      // Note: this method is invoked on the main thread.
      if (call.method == "getBatteryLevel") {
        val batteryLevel = getBatteryLevel()

        if (batteryLevel != -1) {
          result.success(batteryLevel)
        } else {
          result.error("UNAVAILABLE", "Battery level not available.", null)
        }
      } else {
        result.notImplemented()
      }
    }
  }

  private fun getBatteryLevel(): Int {
    val batteryLevel: Int
    if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
      val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
      batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    } else {
      val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
      batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
    }

    return batteryLevel
  }
}
```
import method channel, buat MethodChannel dan panggil setMethodCallHandler yang berisi method getBatteryLevel.
File [batterylevel](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-01/latihan/batterylevel)\
![battery](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-01/latihan/images/battery.PNG)
### Platform channel in Flutter between Dart and Native Code
Pesan dan respon diteruskan secara asynchronous dan UI tetap responsif. 
Buat proyek flutter,\
Buat Platform channel dengan `MethodChannel`
```
class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('flutter.native/helper');
```
Panggil method pada platform channel dengan `invokeMethod`
```
String response = "";
  try {
    final String result = await platform.invokeMethod('helloFromNativeCode');
    response = result;
  } on PlatformException catch (e) {
    response = "Failed to Invoke: '${e.message}'.";
  }
```
Pada MainActivity.java buat implementasi methodchannel java
```
new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
    new MethodChannel.MethodCallHandler() {
        @Override
        public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("helloFromNativeCode")) {
            String greetings = helloFromNativeCode();
            result.success(greetings);
        }
}});
```
File [nativedart](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-01/latihan/nativedart)\
![nativedart](https://github.com/Fourthten/praxis-academy/blob/master/novice/04-01/latihan/images/nativedart.PNG)

Platform Channel, [read1](https://stackoverflow.com/questions/56170451/what-is-the-difference-between-methodchannel-eventchannel-basicmessagechannel), 
[read2](https://fluttertutorial.in/method-channel-in-flutter/).

Sumber:\
[Writing custom platform-specific code](https://flutter.dev/docs/development/platform-integration/platform-channels)\
[Platform Channel in Flutter between Dart and Native Code](https://medium.com/47billion/creating-a-bridge-in-flutter-between-dart-and-native-code-in-java-or-objectivec-5f80fd0cd713)