import 'package:flutter/material.dart';

AppBar CuAppBar(context, String pageName, List<Widget> actionWidgets){
  return AppBar(
    title: Text(pageName),
    actions: actionWidgets,
    backgroundColor: Theme.of(context).colorScheme.secondary,
  );
}