import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:task_3/screens/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());

  runApp( const MaterialApp(
    title: "Ads",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

