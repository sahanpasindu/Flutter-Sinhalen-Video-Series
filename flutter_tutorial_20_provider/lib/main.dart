import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Building MainPage');
    return ChangeNotifierProvider(
      create: (context) => MyData(),
      builder: (BuildContext context, child){
        return Scaffold(
          appBar: AppBar(
          title: Consumer<MyData>(
              builder: (context, value, child) => Text(value.name),
            ),
          ),
        body: Screen2(),
        );
      }
    );
  }
}

class Screen2 extends StatelessWidget {
  Screen2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Building Screen2');
    return Container(
      child: Screen3(),
    );
  }
}

class Screen3 extends StatelessWidget {
  Screen3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Building Screen3');
    return Container(
      child: Screen4(),
    );
  }
}

class Screen4 extends StatelessWidget {
  Screen4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('Building Screen4');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<MyData>(
              builder: (context, value, child) {
                 return Text(value.name);
               },
              ),
          ElevatedButton(
            onPressed: () {
              //Provider.of<MyData>(context, listen: false).changeName("Pasindu");
              context.read<MyData>().changeName(Random().nextInt(100).toString());
            },
            child: Text('Change data'),
          ),
        ],
      ),
    );
  }
}

class MyData extends ChangeNotifier {
  String _name = "Sahan";

  void changeName(String name) {
    _name = name;
    notifyListeners();
  }

  String get name => _name;
}
