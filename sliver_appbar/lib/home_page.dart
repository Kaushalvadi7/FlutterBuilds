import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            leading: Icon(Icons.menu),
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('S L I V E R A P P B A R'),
              background: Container(
                color: Colors.pink,
                child: const Center(
                  child: Text(
                    'Expanded Height',
                    style: TextStyle(color: Colors.white,),
                  ),
                ),
              ),
            ),
          ),
          // Sliver item
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 400.0,
                  color: Colors.purple[300],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 400.0,
                  color: Colors.purple[300],
                ),
              ),
            ),
          ),
                SliverToBoxAdapter(
                       child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                        child: Container(
                        height: 400.0,
                        color: Colors.purple[300],
    ),
    ),
    ),
    ),

        ],
      ),
    );
  }
}