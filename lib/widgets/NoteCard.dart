import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:note_crud/DataBase/fetchData.dart';
import 'package:note_crud/Models/Note.dart';
import 'package:note_crud/Pages/Note_page.dart';

TextStyle ts(Color txtColor, double txtSize) {
  return TextStyle(color: txtColor, fontSize: txtSize);
}

class NoteCard extends StatelessWidget {
  final Note _note;

  NoteCard(this._note);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Material(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(6),
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Note_page(
                        id: _note.id,
                        title: _note.title,
                        body: _note.body,
                      ),
                    ));
              },
              onLongPress: () {
                HttpService().deleteNote(_note.id);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("${_note.id.toString()}/",
                            style: ts(Colors.white.withOpacity(0.7), 20)),
                        Text(_note.title, style: ts(Colors.white, 20)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(_note.body, style: ts(Colors.white, 25)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              Icon(
                (_note.isUpdated) ? Icons.edit : Icons.upload,
                color: Theme.of(context).colorScheme.scrim.withOpacity(0.6),
                size: 15,
              ),
              Text(
                _note.date.toString(),
                style: ts(
                    Theme.of(context).colorScheme.scrim.withOpacity(0.6), 12),
              ),
            ],
          ),
        )
      ],
    );
  }
}
