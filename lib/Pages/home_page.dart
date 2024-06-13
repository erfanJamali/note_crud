import 'package:flutter/material.dart';
import 'package:note_crud/Pages/Note_page.dart';
import 'package:note_crud/theme/theme_provider.dart';
import 'package:note_crud/theme/themes.dart';
import 'package:note_crud/widgets/CuAppBar.dart';
import 'package:note_crud/widgets/NoteCard.dart';
import 'package:note_crud/widgets/SnackMessage.dart';
import 'package:provider/provider.dart';

import '../DataBase/fetchData.dart';
import '../Models/Note.dart';
import '../widgets/ThemeIcon.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

ScrollController _scrollController = ScrollController();

final HttpService httpService = HttpService();
List<Note> notesList = [];

class _home_pageState extends State<home_page> {
  @override
  void initState() {
    super.initState();
    //
    loadFirstDatas();
  }

  void loadFirstDatas() async {
    await loadData(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: CuAppBar(context, "NOTE/CRUD", [
        IconButton(
          onPressed: () {
            loadData(true);
          },
          icon: const Icon(Icons.refresh_rounded),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              Provider.of<ThemeProvider>(listen: false, context).ToggleTheme();
            });
          },
          icon: Icon(themeIcon(context)),
        ),
      ]),
      body: FutureBuilder(
        future: loadData(false),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: List.generate(
                    notesList.length,
                    (index) {
                      return Column(
                        children: [
                          SizedBox(height: (index == 0) ? 25 : 20),
                          NoteCard(notesList[index]),
                          SizedBox(
                              height: (index + 1 == notesList.length) ? 40 : 0),
                        ],
                      );
                    },
                  ),
                ),
              );
            } else {
              return const Center(child: Text("NOTHING HERE!!!"));
            }
          } else {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Note_page(),
              ));
        },
        child: Icon(Icons.add, color: Theme.of(context).colorScheme.scrim),
      ),
    );
  }

  Future<List<Note>> loadData(bool doUpdate) async {
    //TDD
    // do update
    if (!doUpdate) {
      // return await HttpService().getPosts();
      return notesList;
    }
    // set update
    notesList = await HttpService().getNotes();
    // return values
    SnackMessage(context, "Notes refreshed");
    setState(() {});
    return notesList;
  }
}
