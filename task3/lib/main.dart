import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:task_3/screens/home_page.dart';

void main() {
  runApp(const MaterialApp(
    title: "OneSignal",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));

  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize('e16fcb21-61c9-4980-8794-8fa2744ea5a3');
  OneSignal.Notifications.requestPermission(true);
}
