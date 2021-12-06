import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannel extends StatefulWidget {
  @override
  _PlatformChannelState createState() => _PlatformChannelState();
}

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

void main() {
  runApp(MaterialApp(home: PlatformChannel()));
}