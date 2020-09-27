import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
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
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      title: 'Flutter Tutoril 13',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Tutorial 13'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = "CCSL with Flutter";
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                title.text = '';
              },
            ),
            border: InputBorder.none,
            filled: true,
            hintText: 'Search..',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
              child: TextField(
                maxLength: 18,
                controller: title,
                autofocus: true,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 22.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
