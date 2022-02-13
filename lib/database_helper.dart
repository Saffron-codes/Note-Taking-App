import 'package:sqflite/sqflite.dart';
import 'package:sqfun/employee.dart';

class DatabaseHelper{
  final Database database;
  DatabaseHelper(this.database);

  //get all employees
  Future<List<Employee>> getEmployees()async{
    final List<Map<String,dynamic>> maps = await database.query("Employees");
    return List.generate(maps.length, (i) {
    return Employee(
      id: maps[i]['id'],
      name: maps[i]['name'],
      age: maps[i]['age'],
      field:maps[i]['field']
    );
    });
  }
}