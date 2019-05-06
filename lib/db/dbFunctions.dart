import 'package:flutter_app/model/Notes.dart';
import 'package:flutter_app/db/databaseHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
class DbFunctions{

  List notes;
  var db = DatabaseHelper.internal();

  Future createNote(String title,String desc) async {
    var note = Notes(title,desc);
    await db.saveNote(note);
    Fluttertoast.showToast(msg:"Done");
  }

  Future getAllNotes() async{
    notes = await db.getAllNotes();
    notes.forEach((note) => print(note));
  }

  Future updateNote(int id,String title,String desc) async{
    Notes updatedNote =
    Notes.fromMap({'id': id, 'title': title, 'description': desc});
    await db.updateNote(updatedNote);
  }

  Future deleteNote(int id) async{
    await db.deleteNote(id);
    notes = await db.getAllNotes();
    notes.forEach((note) => print(note));
  }

}