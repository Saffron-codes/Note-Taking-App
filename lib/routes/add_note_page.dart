import 'package:flutter/cupertino.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({ Key? key }) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Add Employee"),
        previousPageTitle: "Home",
      ),
      child: Text("ksnfkf"),
    );
  }
}