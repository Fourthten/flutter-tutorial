### Membuat aplikasi yang menampilkan level dan status baterai
Pada runApp memanggil widget `PlatformChannel` yang berisi `_PlatformChannelState`. 
Aplikasi ini menggunakan `methodchannel` untuk melihat level baterai dan `eventchannel` untuk melihat status baterai. 
build disini berisi tampilan level dan status baterai yang di dapat dari platform. 
Ketika klik refresh maka level baterai akan muncul dengan panggil method future `_getBatteryLevel`. 
`invokeMethod` memanggil method channel untuk mendapatkan level baterai. 
`receiveBroadcastStream` untuk mendapatkan status baterai dengan event dan error. 
Pada MainActivity import channel,
```
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.EventSink;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodCall;
```
Buat event channel untuk mendapatkan status baterai dari platform
```
new EventChannel(getFlutterView(), CHARGING_CHANNEL).setStreamHandler(
    new StreamHandler() {
    private BroadcastReceiver chargingStateChangeReceiver;
    @Override
    public void onListen(Object arguments, EventSink events) {
        chargingStateChangeReceiver = createChargingStateChangeReceiver(events);
        registerReceiver(
        chargingStateChangeReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
    }

    @Override
    public void onCancel(Object arguments) {
        unregisterReceiver(chargingStateChangeReceiver);
        chargingStateChangeReceiver = null;
    }
    }
);
```
Buat method channel untuk mendapatkan level baterai dari platform
```
new MethodChannel(getFlutterView(), BATTERY_CHANNEL).setMethodCallHandler(
    new MethodCallHandler() {
    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("getBatteryLevel")) {
        int batteryLevel = getBatteryLevel();

        if (batteryLevel != -1) {
            result.success(batteryLevel);
        } else {
            result.error("UNAVAILABLE", "Battery level not available.", null);
        }
        } else {
        result.notImplemented();
        }
    }
    }
);
```
Method `BroadcastReceiver` untuk cek status baterai saat ini dan method `getBatteryLevel` untuk mengetahui level baterai saat ini. 
Lihat contoh file [batteryapp](https://github.com/Fourthten/praxis-academy/tree/master/novice/04-01/kasus/batteryapp)

<img src="https://github.com/Fourthten/praxis-academy/blob/master/novice/04-01/kasus/images/statuslevel.png" width="300">

Sumber:\
[Platform Channel](https://github.com/flutter/flutter/tree/master/examples/platform_channel)