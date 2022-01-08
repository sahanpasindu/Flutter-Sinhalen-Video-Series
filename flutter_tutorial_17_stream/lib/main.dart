import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   
  StreamController _controller = StreamController();

  addStreamData() async{
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      _controller.sink.add(i);
    }
  }

  Stream<int> addStreamData2() async*{
    for (var i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield i;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStreamData2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Tutorial"),
      ),
      body: Center(
        child: StreamBuilder(
          stream: addStreamData2().where((event) => event.isEven),
          builder: (context, snapshot) {

            if(snapshot.hasError){
              return Text("Error");
            }
            else if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator.adaptive();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Stream Item',
                ),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
