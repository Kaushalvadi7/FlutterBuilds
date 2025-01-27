import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InstagramGridScreen(),
    );
  }
}

class InstagramGridScreen extends StatelessWidget {
  // Sample data for grid items
  final List<String> posts = List.generate(21, (index) => "Post ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Grid"),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Profile Picture Placeholder
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[300],
                    child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
                  ),
                  SizedBox(width: 16),
                  // Profile Stats
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "21",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Posts"),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "7K",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Followers"),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "77",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Following"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(thickness: 2),
            // Grid Section
            GridView.builder(
              shrinkWrap: true, // Ensures the GridView does not take infinite height
              physics: NeverScrollableScrollPhysics(), // Prevents GridView from scrolling independently
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Three posts per row
                crossAxisSpacing: 2, // Space between columns
                mainAxisSpacing: 2, // Space between rows
                childAspectRatio: 1, // Square-shaped items
              ),
              itemCount: posts.length, // Number of grid items
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                  ),
                  child: Center(
                    child: Text(
                      posts[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
