import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  // GET Request (Fetch Data)
  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load posts");
    }
  }

  // POST Request (Create Data)
  Future<Map<String, dynamic>> createPost(String title, String body) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "body": body, "userId": 1}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to create post");
    }
  }

  // PUT Request (Update Data)
  Future<Map<String, dynamic>> updatePost(int id, String title, String body) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"title": title, "body": body, "userId": 1}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to update post");
    }
  }

  // DELETE Request (Delete Data)
  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete post");
    }
  }
}
