import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,

          title: Text('Flutter Widgets'),
        ),
         body:ListView.builder(
           itemCount: 50, //Total number of item
           itemBuilder: (Content,index){
             return ListTile(
                 leading: Icon(Icons.person_2),
                 trailing: Icon(Icons.phone_android),
                 title: Text('person  ${index+1} '),
             );
           },
         )

    );
  }
}
        //All property of container
         // body:Center(
         //   child: Container(
         //     height: 200,
         //     width: 200,
         //     alignment: Alignment.center,
         //     decoration: BoxDecoration(
         //       color: Colors.green,
         //       border: Border.all(
         //         color: Colors.black87,
         //         width: 10,
         //         style: BorderStyle.solid,
         //       ),
         //       borderRadius: BorderRadius.circular(20.0),
         //       boxShadow: [BoxShadow(
         //       blurRadius: 50.0,
         //       color: Colors.grey,
         //       spreadRadius: 20.0,
         //     )
         //     ]),
         //     child: Text('Hello People',
         //     style: TextStyle(fontSize: 25,
         //     color: Colors.white),
         //     ),
         //   ),
         // )



        //Simple container
      //   body:Center(
        //   child: Container(
        //     width: 170,
        //     height: 150,
        //     color: Colors.blueAccent,
        //     child: Center(child: Text('Hello Devloper!! How are can i help you in this condition ',
        //         style: TextStyle(
        //           fontSize: 19, backgroundColor: Colors.white, fontWeight: FontWeight.bold
        //          ), maxLines: 4)),
        //   ),
        // ),
