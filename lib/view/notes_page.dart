import 'package:flutter/material.dart';
import 'package:flutter_16/utils/dialog_upd_utils.dart';
import 'package:flutter_16/viewmodel/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_16/utils/dialog_add_utils.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // late final _notesRepo = NotesRepository();
  // var _notes = <Note>[];
  final HomeStore viewModel = HomeStore();

  @override
  void initState() {
    super.initState();
    //_notesRepo.initDB().whenComplete(() => setState(() => _notes = _notesRepo.notes));
    viewModel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Observer(
        builder: (_) {
          final notes = viewModel.notes;
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(
                notes[index].name,
              ),
              subtitle: Text(
                notes[index].description,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async =>
                        showDialogUpdate(context, notes[index], viewModel),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    // удаление заметки
                    onPressed: () async {
                      await viewModel.deleteNote(notes[index].id);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialogAdd(context, viewModel),
      ),
    );
  }
}
