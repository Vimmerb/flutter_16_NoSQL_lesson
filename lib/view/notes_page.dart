import 'package:flutter/material.dart';
import 'package:flutter_16/model/note.dart';
import 'package:flutter_16/services/notes_repository.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  late final _notesRepo = NotesRepository();
  var _notes = <Note>[];

  @override
  void initState() {
    super.initState();
    _notesRepo
        .initDB()
        .whenComplete(() => setState(() => _notes = _notesRepo.notes));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(
            _notes[index].name,
          ),
          subtitle: Text(
            _notes[index].description,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () async => _showDialogUpdate(_notes[index]),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await _notesRepo.deleteNote(_notes[index].id);
                  setState(() {
                    _notes = _notesRepo.notes;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showDialog(),
      ),
    );
  }

  Future _showDialogUpdate(Note note) => showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) {
          final nameController = TextEditingController(text: note.name);
          final descController = TextEditingController(text: note.description);
          return AlertDialog(
            title: const Text('Edit note'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  final updatedNote = Note(
                    id: note.id,
                    name: nameController.text,
                    description: descController.text,
                  );
                  await _notesRepo.updateNote(note.id, updatedNote);
                  setState(() {
                    _notes = _notesRepo.notes;
                    Navigator.pop(context);
                  });
                },
                child: const Text('Save'),
              )
            ],
          );
        },
      );

  Future _showDialog() => showGeneralDialog(
        context: context,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) {
          final nameController = TextEditingController();
          final descController = TextEditingController();
          return AlertDialog(
            title: const Text('New note'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  await _notesRepo.addNote(
                    Note(
                      name: nameController.text,
                      description: descController.text,
                    ),
                  );
                  setState(() {
                    _notes = _notesRepo.notes;
                    Navigator.pop(context);
                  });
                },
                child: const Text('Add'),
              )
            ],
          );
        },
      );
}
