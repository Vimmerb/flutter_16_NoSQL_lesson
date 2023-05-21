import 'package:flutter_16/model/note.dart';
import 'package:flutter_16/services/notes_repository.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart'; // Указание для кодогенерации

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final _notesRepo = NotesRepository();

  @observable
  List<Note> notes = [];

  @action
  Future<void> fetchData() async {
    await _notesRepo.initDB();
    notes = _notesRepo.notes;
  }

  @action
  Future<void> addNote(Note note) async {
    await _notesRepo.addNote(note);
    notes = _notesRepo.notes;
  }

  @action
  Future<void> updateNote(int id, Note note) async {
    await _notesRepo.updateNote(id, note);
    notes = _notesRepo.notes;
  }

  @action
  Future<void> deleteNote(int id) async {
    await _notesRepo.deleteNote(id);
    notes = _notesRepo.notes;
  }
}
