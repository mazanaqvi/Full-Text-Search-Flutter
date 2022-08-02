import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sqlite_search/services/db_helper.dart';
import 'package:sqlite_search/controllers/db_controller.dart';
import 'package:sqlite_search/services/html_parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DbHelper dbHelper = DbHelper();
  HTMLParser htmlParser = HTMLParser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search`'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.pinkAccent,
                Colors.pink,
                Colors.green,
                Colors.pink,
                Colors.blueGrey,
                Colors.pink,
                Colors.pinkAccent,
                Colors.pink,
                Colors.pinkAccent,
              ],
            )),
            child: const Center(
              child: Text(
                'Full Text Search',
                style: TextStyle(
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Center(
              child: ElevatedButton(
                  autofocus: true,
                  onPressed: () => {
                        dbHelper.openDB(),
                      },
                  child: const Text(
                    "Open DB",
                    style: TextStyle(fontSize: 30),
                  ))),
          Center(
              child: ElevatedButton(
                  autofocus: true,
                  onPressed: () => {
                        dbHelper.getFromExistingDB(),
                      },
                  child: const Text(
                    "Get from existing DB",
                    style: TextStyle(fontSize: 30),
                  ))),
          Center(
              child: ElevatedButton(
                  autofocus: true,
                  onPressed: () => {
                        htmlParser.parseHTML(),
                      },
                  child: const Text(
                    "Parse HTML",
                    style: TextStyle(fontSize: 30),
                  ))),
        ],
      ),
    );
  }
}
