import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'news_model.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  late Future<NewsModel> newsFuture;

  Future<NewsModel> fetchNews() async {
    final url =
        "https://newsapi.org/v2/everything?q=tesla&from=2025-02-02&sortBy=publishedAt&apiKey=d3eccaf4adfa4df5a8897c78cca0b2b4";

    try {
      final response =
      await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        return NewsModel.fromJson(result);
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet Connection.");
    } on FormatException {
      throw Exception("Invalid API Response.");
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    newsFuture = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
      ),
      body: FutureBuilder<NewsModel>(
        future: newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 50),
                  SizedBox(height: 10),
                  Text(snapshot.error.toString(), textAlign: TextAlign.center),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        newsFuture = fetchNews();
                      });
                    },
                    child: Text("Retry"),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.articles == null || snapshot.data!.articles!.isEmpty) {
            return Center(child: Text("No news available."));
          }

          return ListView.builder(
            itemCount: snapshot.data!.articles!.length,
            itemBuilder: (context, index) {
              final article = snapshot.data!.articles![index];
              return ListTile(
                leading: article.urlToImage != null
                    ? CircleAvatar(
                  backgroundImage: NetworkImage(article.urlToImage!),
                )
                    : Icon(Icons.image_not_supported),
                title: Text(article.title ?? "No Title"),
                subtitle: Text(article.description ?? "No Description"),
              );
            },
          );
        },
      ),
    );
  }
}
