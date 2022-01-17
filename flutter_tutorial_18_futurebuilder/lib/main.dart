import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/Users.dart';
import 'screens/details.dart';

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
      home: const MyHomePage(title: 'Future Builder'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<User>> getUsers() async {
    var url = Uri.parse('https://randomuser.mee/api/?results=20');
    late http.Response response;
    List<User> users = [];

    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        Map peopleData = jsonDecode(response.body);
        List<dynamic> peoples = peopleData["results"];

        for (var item in peoples) {
          var email = item['email'];
          var name = item['name']['first'] + " " + item['name']['last'];
          var id = item['login']['uuid'];
          var avatar = item['picture']['large'];
          User user = User(id, name, email, avatar);
          users.add(user);
        }
      } else {
        return Future.error("Something gone wrong, ${response.statusCode}");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Waiting'),
            );
          } else {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(snapshot.data[index].avatar),
                      ),
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].email),
                      onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDetail(snapshot.data[index]),
                              ),
                            );
                      },
                    );
                  });
            }
          }
        },
      ),
    );
  }
}
