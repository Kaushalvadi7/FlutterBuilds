import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  // Fetch Posts
  Future<void> _fetchPosts() async {
    final data = await apiService.fetchPosts();
    setState(() {
      posts = data;
    });
  }

  // Create Post
  Future<void> _createPost() async {
    final newPost = await apiService.createPost("New Title", "This is a new post");
    setState(() {
      posts.insert(0, newPost);
    });
  }

  // Update Post
  Future<void> _updatePost(int id) async {
    final updatedPost = await apiService.updatePost(id, "Updated Title", "Updated content");
    setState(() {
      int index = posts.indexWhere((post) => post['id'] == id);
      if (index != -1) {
        posts[index] = updatedPost;
      }
    });
  }

  // Delete Post
  Future<void> _deletePost(int id) async {
    await apiService.deletePost(id);
    setState(() {
      posts.removeWhere((post) => post['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HTTP Requests Example")),
      body: posts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post['title']),
            subtitle: Text(post['body']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => _updatePost(post['id']),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deletePost(post['id']),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createPost,
        child: const Icon(Icons.add),
      ),
    );
  }
}
