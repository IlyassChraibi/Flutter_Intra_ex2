import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:exercice_2/transfer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

String mois = "";
String annee = "";
String jour = "";

List<Info> infos = [];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  void Info() async {
    Dio dio = Dio();
    var response = await dio.get('https://exercices-web.herokuapp.com/exam/$annee/$mois/$jour');
    for(var date in response.data)
      {
        print(date);
        infos.add(date);
      }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Expanded(
            child : ListView.builder(
              // Let the ListView know how many items it needs to build.
              itemCount: infos.length,
              // Provide a builder function. This is where the magic happens.
              // Convert each item into a widget based on the type of item it is.
              itemBuilder: (context, index) {
                final item = infos[index];

                return ListTile(
                  title: Text(item.annee),
                  subtitle: Text(item.mois),
                );
              },
            ),
          ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'année',
                    // TODO: add errorHint
                  ),
                  onChanged: (value) => annee = value,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'mois',
                    // TODO: add errorHint
                  ),
                  onChanged: (value) => mois = value,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'jour',
                    // TODO: add errorHint
                  ),
                  onChanged: (value) => jour = value,
                ),
              ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: Info,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
