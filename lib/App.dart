import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfun/routes/add_employee_page.dart';
import 'package:sqfun/routes/home_page.dart';

class App extends StatefulWidget {
  final Database database;
  const App({ Key? key, required this.database }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes:{
        "/":(context) => homePage(database: widget.database,),
        "/add":(context)=>AddUserPage(),
      }
    );
  }
}