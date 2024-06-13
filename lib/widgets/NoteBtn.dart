import 'package:flutter/material.dart';

import '../DataBase/fetchData.dart';
import 'NoteField.dart';

class NoteBtn extends StatelessWidget {
  final bool _isNew;
  final VoidCallback _fun;

  NoteBtn(this._isNew, this._fun);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.05,
      child: Material(
        color: Theme
            .of(context)
            .colorScheme
            .secondary,
        child: InkWell(
          onTap: () {
          _fun;
          },
          child: Center(
            child: Text(
              (_isNew) ? "SAVE" : "UPDATE",
            ),
          ),
        ),
      ),
    );
  }
}
