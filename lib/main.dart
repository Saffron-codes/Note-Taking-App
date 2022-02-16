import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfun/App.dart';

import 'database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await init_db();
  runApp(App(
    database: database,
  ));
}

Future<Database> init_db() async {
  return await openDatabase(("Notes.db"),
          onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE IF NOT EXISTS Notes(id INTEGER PRIMARY KEY,title TEXT,content TEXT,dateTime TEXT)');
  }, version: 1)
      .then((value) {
    if (value.isOpen) {
      print("Opened database");
      print(value.path);
    } else {
      print("Error opening database");
    }
    return value;
  });
}
