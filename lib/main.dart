import 'package:flutter/material.dart';
import 'package:flutter_app/db/databaseHelper.dart';
import 'package:flutter_app/db/dbFunctions.dart';

List notes;
var db = new DatabaseHelper();
var dbFunctions = DbFunctions();
void main()  {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  var title = "Notes App";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: mySampleWidgetWithThreeButtons(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              dbFunctions.createNote("Hey!","Hey, Guest\n Welcome to my app");
            },
            tooltip: 'Create',
            child: Icon(Icons.add)));
  }

}

Widget mySampleWidgetWithThreeButtons() {
  return Center(
    // Center is a layout widget. It takes a single child and positions it
    // in the center of the parent.
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () => {dbFunctions.getAllNotes()},
          child: Text("Show Notes"),
        ),
        Padding(
          padding: const EdgeInsets.all(3),
        ),
        FlatButton(
          onPressed: () => {dbFunctions.updateNote(1, "Updated note", "Updated note descriptions")},
          child: Text("Update Notes"),
        ),
        Padding(
          padding: const EdgeInsets.all(3),
        ),
        FlatButton(
          onPressed: () => {dbFunctions.deleteNote(1)},
          child: Text("Delete Notes"),
        ),
      ],
    ), // This trailing comma makes auto-formatting nicer for build methods.
  );
}




