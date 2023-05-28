import 'package:flutter_16/domain/model/note.dart';

abstract class NoteInteractor {
  List<Note> get notes;
  Future initDB();
  Future addNote(Note note);
  Future deleteNote(int id);
  Future updateNote(int id, Note note);
}
