import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news_model.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
    Future<NewsModel> fetchNews() async {
      final url = "https://newsapi.org/v2/everything?q=tesla&from=2025-02-02&sortBy=publishedAt&apiKey=d3eccaf4adfa4df5a8897c78cca0b2b4";
      var response = await  http.get(Uri.parse(url));
      if(response.statusCode == 200){
        final result = jsonDecode(response.body);
        return NewsModel.fromJson(result);
      }
      else{
        return NewsModel();
    }
}

@override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        centerTitle: true,
      ),
      body: FutureBuilder(future: fetchNews(), builder:(context, snapshot){
        return ListView.builder(itemBuilder: (context, index){
          return  ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage("${snapshot.data!.articles![index].urlToImage}"),
            ),
            title: Text("${snapshot.data!.articles![index].title}"),
            subtitle: Text("${snapshot.data!.articles![index].description}"),
          );
        },itemCount: snapshot.data!.articles!.length,
        );
      } ),
    );
  }
}
