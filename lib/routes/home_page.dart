import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfun/database_helper.dart';
import 'package:sqfun/employee.dart';

class homePage extends StatefulWidget {
  final Database database;
  const homePage({Key? key, required this.database}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    final Database db = widget.database;
    final DatabaseHelper databaseHelper= DatabaseHelper(db);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Employees"),
        trailing: CupertinoButton(
          padding: EdgeInsets.all(10),
          child: Icon(CupertinoIcons.add),
          onPressed: ()async{
            Navigator.pushNamed(context, "/add");
            Employee myemployee = Employee(id: 4, name: "Ben Harris", age: 13, field: "Gamer");
            await db.insert('Employees', myemployee.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
          },
        ),
      ),
      child: FutureBuilder(
        future: databaseHelper.getEmployees(),
        builder: (context,AsyncSnapshot<List<Employee>> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
              itemCount:snapshot.data!.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      
                      children: [
                        Text(snapshot.data![index].id.toString()),
                        SizedBox(width: 40,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data![index].name),
                            Text(snapshot.data![index].age.toString()),
                          ],
                        ),
                        Spacer(),
                        Text(snapshot.data![index].field),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          return Center(
              child: CupertinoActivityIndicator(),
            );
        },
      )
    );
  }
}
