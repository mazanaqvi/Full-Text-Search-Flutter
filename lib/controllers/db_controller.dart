import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class DBController extends GetxController {
  String controllerString = '';
  late Database articledb;
  @override
  void onInit() {
    super.onInit();
    openDB();
  }

  openDB() async {
    // Construct the path to the app's writable database file:
    var dbDir = await getDatabasesPath();
    var dbPath = path.join(dbDir, "app.db");

// Delete any existing database:
    await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("assets/magazine.db");
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
    articledb = await openDatabase(dbPath);
    print("Db is open now do your work");
  }
}
