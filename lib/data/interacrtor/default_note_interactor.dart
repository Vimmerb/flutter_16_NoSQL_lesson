import 'package:flutter_16/domain/model/note.dart';
import 'package:flutter_16/domain/interactor/note_interactor.dart';
import 'package:flutter_16/domain/service/notes_repository_service.dart';
import 'package:injectable/injectable.dart';

//Client
@Injectable(as: NoteInteractor)
class DefaultNoteInteractor implements NoteInteractor {
  // late final NotesRepositoryService _service = RepositoryService();
  final NotesRepositoryService _service; // Service

  DefaultNoteInteractor(this._service);

  // @override
  // Future initDB() => _service.initDB();
  @override
  Future addNote(Note note) => _service.addNote(note);
  @override
  Future deleteNote(int id) => _service.deleteNote(id);
  @override
  Future updateNote(int id, Note note) => _service.updateNote(id, note);

  @override
  List<Note> get notes => _service.notes;
}
