import 'dart:convert';

import 'package:http/http.dart';

import '../Models/Note.dart';
import 'package:http/http.dart' as http;

class HttpService {
  // final Uri postsURL = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  // final Uri postsURL = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  final Uri notesURL = Uri.parse("https://vasslekaar.pythonanywhere.com/notes");

  Future<List<Note>> getNotes() async {
  Response res = await get(notesURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Note> notes = body
          .map(
            (dynamic item) => Note.fromJson(item),
          )
          .toList();

      return notes;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<http.Response> postNote(String title, String body) {
    return http.post(
      Uri.parse("https://vasslekaar.pythonanywhere.com/notes"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'body': body,
      }),
    );
  }

  Future<void> putNote(int id, String title, String body) async {
    final apiUrl = 'https://vasslekaar.pythonanywhere.com/notes/$id';

    // final updatedNote = Note(id: noteId, title: newTitle, body: newBody);
    // final updatedNoteJson = updatedNote.toJson();

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'title': title,
          'body': body,
        }),
      );

      if (response.statusCode == 200) {
        print('Note updated successfully!');
      } else {
        print('Error updating note: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating note: $e');
    }
  }

  Future<void> deleteNote(int noteId) async {
    final apiUrl = 'https://vasslekaar.pythonanywhere.com/notes/$noteId';

    try {
      final response = await http.delete(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Note deleted successfully!');
      } else {
        print('Error deleting note: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting note: $e');
    }
  }

}
