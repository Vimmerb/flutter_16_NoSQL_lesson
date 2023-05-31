import 'package:flutter_16/di/config.dart';
import 'package:flutter_16/domain/model/note.dart';
import 'package:flutter_16/generated/objectbox.g.dart';
import 'package:flutter_16/domain/service/notes_repository_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NotesRepositoryService)
class RepositoryService implements NotesRepositoryService {
  final Store _store = getIt<Store>();
  late final Box<Note> _box;

  RepositoryService() {
    _box = _store.box<Note>();
  }

  @override
  List<Note> get notes => _box.getAll();

  // @override
  // Future initDB() async {
  //   _store = await openStore();
  //   _box = _store.box<Note>();
  // }

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
