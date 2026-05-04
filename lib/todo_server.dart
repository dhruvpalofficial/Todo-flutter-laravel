import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'todo_model.dart';

class TodoService {
  static const String baseUrl = "http://192.168.1.7:8000/api";

  static Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse("$baseUrl/todos"));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((item) => Todo.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load todos");
    }
  }

  static Future<void> addTodo(String title) async {
    final response = await http.post(
      Uri.parse("$baseUrl/todos"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({"title": title}),
    );

    debugPrint("STATUS CODE: ${response.statusCode}");
    debugPrint("RESPONSE BODY: ${response.body}");

    if (response.statusCode != 201) {
      throw Exception("Failed to add todo: ${response.body}");
    }
  }

  static Future<void> deleteTodo(int id) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/todos/$id"),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to delete todo");
    }
  }

  static Future<void> updateTodo(int id, bool isDone) async {
    final response = await http.put(
      Uri.parse("$baseUrl/todos/$id"),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({"is_done": isDone}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update todo");
    }
  }
}