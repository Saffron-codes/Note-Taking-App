import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqfun/database_helper.dart';
import 'package:sqfun/note.dart';
import 'package:sqfun/utils/convert_to_ago.dart';

class homePage extends StatefulWidget {
  final Database database;
  const homePage({Key? key, required this.database}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Note> _myNotes = [];

  loadNotes(Database db) async {
    _myNotes = await DatabaseHelper(db).getEmployees();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final Database db = widget.database;
    final DatabaseHelper databaseHelper = DatabaseHelper(db);
    loadNotes(db);
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Employees"),
          trailing: CupertinoButton(
            padding: EdgeInsets.all(10),
            child: Icon(CupertinoIcons.add),
            onPressed: () async {
              Navigator.pushNamed(context, "/add");
              Note myemployee = Note(
                  id: 1,
                  title: "Groceries",
                  content: "Chicken",
                  dateTime: DateTime.now().toString());
              await db.insert('Notes', myemployee.toMap(),
                  conflictAlgorithm: ConflictAlgorithm.replace);
            },
          ),
        ),
        child:ListView.builder(
          itemCount: _myNotes.length,
          itemBuilder: (context,idx){
            return  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Text(_myNotes[idx].id.toString()),
                          SizedBox(
                            width: 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_myNotes[idx].title),
                              Text(_myNotes[idx].content),
                            ],
                          ),
                          Spacer(),
                          Text(convertToAgo(DateTime.tryParse(_myNotes[idx].dateTime)!)),
                        ],
                      ),
                    ),
                  );
          },
        )
        );
  }
}
