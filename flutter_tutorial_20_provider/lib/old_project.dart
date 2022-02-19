import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String name = "Sahan";

  void changeName(String newName){
    setState(() {
      name = newName;
    });
  }
  @override
  Widget build(BuildContext context) {
    print('Building MainPage');
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Screen2(name:name, changeName: changeName),
    );
  }
}

class Screen2 extends StatelessWidget {
  Screen2({Key? key, required this.name, required this.changeName}) : super(key: key);
  String name;
  Function changeName;
  @override
  Widget build(BuildContext context) {
    print('Building Screen2');
    return Container(
      child: Screen3(name:name, changeName: changeName),
    );
  }
}

class Screen3 extends StatelessWidget {
  Screen3({Key? key, required this.name, required this.changeName}) : super(key: key);
  String name;
  Function changeName;
  @override
  Widget build(BuildContext context) {
    print('Building Screen3');
    return Container(
      child: Screen4(name:name, changeName: changeName),
    );
  }
}

class Screen4 extends StatelessWidget {
  Screen4({Key? key, required this.name, required this.changeName}) : super(key: key);
  String name;
  Function changeName;
  @override
  Widget build(BuildContext context) {
    print('Building Screen4');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name),
          ElevatedButton(
            onPressed: () {
              changeName('Pasindu');
            },
            child: Text('Change data'),
          ),
        ],
      ),
    );
  }
}