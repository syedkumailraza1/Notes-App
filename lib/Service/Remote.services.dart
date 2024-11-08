import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo/Model/note.model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

 static Future<List<Note>> fetchNotes() async {
  var response = await client.get(
    Uri.parse('https://notes-app-nu-lime.vercel.app/api/notes'),
  );
  if (response.statusCode != 200) {
    throw Exception(
        'Error while fetching Data: ' + response.statusCode.toString());
  }
  var jsonData = response.body;
  print("API RESPONSE: ${notesFromJson(jsonData)}");
  return notesFromJson(jsonData);
}


  static Future<List<Note>?>? deleteNotes(noteId) async {
    var response = await client.delete(
      Uri.parse('https://notes-app-nu-lime.vercel.app/api/notes/${noteId}'),
    );
    if (response.statusCode != 200) {
      throw Exception(
          'Error while fetching Deleting: ' + response.statusCode.toString());
    }
    return null;
  }

 static Future<Note> editNote(String noteId, String title, String content, List<String> tags) async {
    var response = await client.put(
      Uri.parse('https://notes-app-nu-lime.vercel.app/api/notes/$noteId'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "content": content,
        "tags": tags,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error while updating note: ${response.statusCode}');
    }
    
    
    return noteFromJson(response.body);
  }

static Future<Note> createNote(String title, String content, List<String> tags) async {
    var response = await client.post(
      Uri.parse('https://notes-app-nu-lime.vercel.app/api/notes/'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "content": content,
        "tags": tags,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Error while Adding note: ${response.statusCode}');
    }

    
    return noteFromJson(response.body);
  }
}