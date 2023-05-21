import 'package:flutter/material.dart';
import 'package:flutter_16/viewmodel/home_store.dart';
import 'package:flutter_16/model/note.dart';

Future showDialogUpdate(BuildContext context, Note note, HomeStore viewModel) =>
    showGeneralDialog(
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
              // редактирование заметки
              onPressed: () async {
                final updatedNote = Note(
                  id: note.id,
                  name: nameController.text,
                  description: descController.text,
                );
                await viewModel.updateNote(note.id, updatedNote);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            )
          ],
        );
      },
    );
