import 'package:flutter_16/domain/model/note.dart';
import 'package:flutter_16/generated/objectbox.g.dart';
import 'package:flutter_16/domain/service/notes_repository_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: NotesRepositoryService)
class RepositoryService implements NotesRepositoryService {
  late final Store _store;
  late final Box<Note> _box;

  List<Note> get notes => _box.getAll();

  @override
  Future initDB() async {
    _store = await openStore();
    _box = _store.box<Note>();
  }

  @override
  Future addNote(Note note) async {
    await _box.putAsync(note);
  }

  @override
  Future deleteNote(int id) async {
    _box.remove(id);
  }

  @override
  Future updateNote(int id, Note note) async {
    _box.remove(id);
    await _box.putAsync(note);
  }
}
