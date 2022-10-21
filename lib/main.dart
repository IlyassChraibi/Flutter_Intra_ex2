import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/material.dart';

import 'DTO.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SingletonDio {

  static var cookiemanager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookiemanager);
    return dio;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Date> listDate = [];

  String jourField = '';
  String moisField = '';
  String anneeField = '';

  void _incrementCounter() async {

    try {
      var response = await SingletonDio.getDio().get('https://exercices-web.herokuapp.com/exam/$anneeField/$moisField/$jourField');
      print(response);

      for(var res in response.data){
        Date date = Date.fromJson(res);
        listDate.add(date);
        print(date);
      }
      setState(() {});


    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextField(
                        onChanged: (value) {
                          jourField = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'jour',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        onChanged: (value) {
                          moisField = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'mois',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        onChanged: (value) {
                          anneeField = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'annee',
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Expanded(
              flex: 9,
              child: ListView(
                children: this.listDate.map(pipo).toList(),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget pipo(Date e)  {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      tileColor: Colors.blue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(e.jour.toString()),
          Text(e.mois.toString()),
          Text(e.annee.toString()),
          Text(e.jourDeLaSemaine)
        ],
      ),
    ),
  );
}
