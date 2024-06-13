import 'package:flutter/material.dart';
import 'package:note_crud/widgets/NoteCard.dart';

class NoteField extends StatelessWidget {
  final String text;
  final bool isTitle;

  NoteField(this.text, this.isTitle);

  final TextEditingController _controller = TextEditingController();

  String get getControl {
    return _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = text;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        style: ts(Theme.of(context).colorScheme.scrim, (isTitle) ? 20 : 17)
            .copyWith(
                fontStyle: (isTitle) ? FontStyle.italic : FontStyle.normal),
        minLines: (isTitle) ? 1 : 2,
        maxLines: (isTitle) ? 2 : 10,
        controller: _controller,
        cursorColor: Theme.of(context).colorScheme.scrim,
        decoration: InputDecoration(
          labelStyle: ts(Theme.of(context).colorScheme.scrim, 17),
          labelText: (isTitle) ? "Title" : "Body",
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Theme.of(context).colorScheme.scrim
            ),
          ),
        ),
      ),
    );
  }
}
