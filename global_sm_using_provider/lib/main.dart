import 'package:flutter/material.dart';
import 'package:global_state_management_using_provider/counter_provider.dart';
import 'package:provider/provider.dart';

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
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (_) => CounterProvider(),
          child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    print("build function called!!!");
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Consumer<CounterProvider>(
            builder: (ctx, _, __){
              print("Consumer build function called!!");
          return  Text(
              //"${Provider.of<CounterProvider>(ctx, listen:true ).getCount()}", style: TextStyle(fontSize: 25));
                  "${ctx.watch<CounterProvider>().getCount()}",style: TextStyle(fontSize: 25));
        })
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(onPressed: (){
            //Provider.of<CounterProvider>(context, listen: false).incrementCount();
            context.read<CounterProvider>().decrementCount();
          },
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(onPressed: (){
            //Provider.of<CounterProvider>(context, listen: false).incrementCount();
            context.read<CounterProvider>().incrementCount();
          },
          child: Icon(Icons.add),
          ),
        ],
      ),
      );

  }
}
