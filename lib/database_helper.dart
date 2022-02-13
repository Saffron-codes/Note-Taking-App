import 'package:sqflite/sqflite.dart';
import 'package:sqfun/employee.dart';

class DatabaseHelper{
  final Database database;
  DatabaseHelper(this.database);

  //get all employees
  Future<List<Note>> getEmployees()async{
    final List<Map<String,dynamic>> maps = await database.query("Notes");
    return List.generate(maps.length, (i) {
    return Note(
      id: maps[i]['id'],
      title: maps[i]['title'],
      content: maps[i]['content'],
      dateTime:maps[i]['dateTime']
    );
    });
  }
}