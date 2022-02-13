import 'package:flutter/cupertino.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({ Key? key }) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
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