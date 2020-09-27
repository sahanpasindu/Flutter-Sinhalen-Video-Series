import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() => runApp(DevicePreview(builder: (context) => MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      title: 'Flutter Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Navigation'),
//      routes: <String, WidgetBuilder>{
//        '/second': (context) => SecondScreen(),
//      },
    );
  }
}
