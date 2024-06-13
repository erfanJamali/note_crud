import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_crud/DataBase/fetchData.dart';
import 'package:note_crud/Pages/home_page.dart';
import 'package:note_crud/widgets/NoteBtn.dart';
import 'package:note_crud/widgets/NoteField.dart';

import '../widgets/CuAppBar.dart';

class Note_page extends StatelessWidget {
  String? title;
  String? body;
  int? id;

  Note_page({this.id, this.title, this.body});

  @override
  Widget build(BuildContext context) {
    bool isNew = (id == null) ? true : false;
    if (isNew) {
      id = notesList.length + 1;
      title = "";
      body = "";
    }

    NoteField titleField = NoteField(title!, true);
    NoteField bodyField = NoteField(body!, false);

    Future<void> btnFun() async {
      if (isNew) {
        await HttpService()
            .postNote(titleField.getControl, bodyField.getControl);
      } else {
        await HttpService()
            .putNote(id!, titleField.getControl, bodyField.getControl);
      }
      Navigator.pop(context);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CuAppBar(context, (isNew) ? "NEW NOTE" : "EDIT NOTE", []),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          titleField,
          bodyField,
          NoteBtn(isNew, () {
            btnFun();
          }),
        ],
      ),
    );
  }
}
