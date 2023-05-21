// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$notesAtom = Atom(name: '_HomeStore.notes', context: context);

  @override
  List<Note> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(List<Note> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$fetchDataAsyncAction =
      AsyncAction('_HomeStore.fetchData', context: context);

  @override
  Future<void> fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  late final _$addNoteAsyncAction =
      AsyncAction('_HomeStore.addNote', context: context);

  @override
  Future<void> addNote(Note note) {
    return _$addNoteAsyncAction.run(() => super.addNote(note));
  }

  late final _$updateNoteAsyncAction =
      AsyncAction('_HomeStore.updateNote', context: context);

  @override
  Future<void> updateNote(int id, Note note) {
    return _$updateNoteAsyncAction.run(() => super.updateNote(id, note));
  }

  late final _$deleteNoteAsyncAction =
      AsyncAction('_HomeStore.deleteNote', context: context);

  @override
  Future<void> deleteNote(int id) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(id));
  }

  @override
  String toString() {
    return '''
notes: ${notes}
    ''';
  }
}
