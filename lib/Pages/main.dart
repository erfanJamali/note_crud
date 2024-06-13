import 'package:flutter/material.dart';
import 'package:note_crud/Pages/Note_page.dart';
import 'package:note_crud/Pages/home_page.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provider.dart';

void main() async {

  // await loadData(true, "main");

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const StartPoint(),
    ),
  );
}

class StartPoint extends StatelessWidget {
  const StartPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: const home_page(),
    );
  }
}


