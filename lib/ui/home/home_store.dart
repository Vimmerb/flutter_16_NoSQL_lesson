import 'package:flutter_16/domain/interactor/note_interactor.dart';
import 'package:flutter_16/domain/model/note.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart'; // Указание для кодогенерации

@Injectable() // Здесь мы не передаём никакой абстрактный класс, так как
// используем HomeStore напрямую.
class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  //final _notesRepo = NotesRepositoryServ();
  // final RepositoryService _interactor = RepositoryService();
  final NoteInteractor interactor;
  _HomeStore(this.interactor);

  @observable
  List<Note> notes = [];

  // @action
  // Future initDB() async {
  //   await interactor.initDB();
  //   notes = interactor.notes;
  // }

  @action
  Future addNote(Note note) async {
    await interactor.addNote(note);
    notes = interactor.notes;
  }

  @action
  Future updateNote(int id, Note note) async {
    await interactor.updateNote(id, note);
    notes = interactor.notes;
  }

  @action
  Future deleteNote(int id) async {
    await interactor.deleteNote(id);
    notes = interactor.notes;
  }
}
