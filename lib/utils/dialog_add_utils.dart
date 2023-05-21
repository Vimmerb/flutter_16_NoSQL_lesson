import 'package:flutter/material.dart';
import 'package:flutter_16/viewmodel/home_store.dart';
import 'package:flutter_16/model/note.dart';

Future showDialogAdd(BuildContext context, HomeStore viewModel) =>
    showGeneralDialog(
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
              // добавление заметки
              onPressed: () async {
                await viewModel.addNote(
                  Note(
                    name: nameController.text,
                    description: descController.text,
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Add'),
            )
          ],
        );
      },
    );
