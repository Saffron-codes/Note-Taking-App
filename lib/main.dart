import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfun/App.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final database = await openDatabase(
    (await getDatabasesPath()+"Notes.db"),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE IF NOT EXISTS Notes(id INTEGER PRIMARY KEY,name TEXT,age INTEGER,field TEXT)'
        );
    },
    version: 1
  );
  runApp(App(database: database,));
}