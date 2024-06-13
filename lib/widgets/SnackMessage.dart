import 'package:flutter/material.dart';
import 'package:note_crud/widgets/NoteCard.dart';

void SnackMessage(context, String _text) {
  SnackBar snackBar = SnackBar(
    content: Text(
      _text,
      style: ts(Colors.white, 15),
    ),
    backgroundColor: Colors.blueGrey.withOpacity(0.85),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
