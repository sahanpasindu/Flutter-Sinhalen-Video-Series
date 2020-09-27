import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Tutorial 08"),
      ),
      body: Container(
        width: double.infinity,
        height: 200,
        alignment: Alignment.center,
        color: Colors.orange,
        child: Text(
          'Container Widget!!',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
