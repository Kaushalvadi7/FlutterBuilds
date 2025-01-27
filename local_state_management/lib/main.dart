import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var label ="This is SetState Demo";
  var colorContainer =Colors.grey;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("SetState demo"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.indigoAccent,
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Container(width: 100, height: 100, color: colorContainer),
              const SizedBox(height: 50,),
              Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              const SizedBox(height: 50,),
              ElevatedButton(onPressed: (){
                setState(() {
                  label = "Change Value";
                  colorContainer =Colors.deepPurple;
                });
                print(label);
              },
                  child : Text("Change", style: TextStyle(fontSize: 25, color: Colors.black)),
              )
            ],
          ),
        )
      ),
    );
  }
}
