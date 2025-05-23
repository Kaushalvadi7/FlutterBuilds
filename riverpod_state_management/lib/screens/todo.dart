import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/todo_model.dart';
import '../providers/todo_provider.dart';

class Todo extends ConsumerWidget {
  Todo({super.key});

  final TextEditingController inputController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: inputController,
              decoration: InputDecoration(
                  hintText: "Type your task",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              onFieldSubmitted: (value) => {
                ref.read(todosProvider.notifier).addTodo(
                  TodoModel(
                    id: Random().nextInt(99999),
                    description: value,
                    completed: false,
                  ),
                ),
                showSnackBar(context),
                inputController.text = "",
              },
            ),
            const SizedBox(
              height: 20,
            ),

            // display todo
            Consumer(builder: (context, WidgetRef ref, child) {
              final todos = ref.watch(todosProvider);
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: todos.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(todos[index].description,
                      style: todos[index].completed ?  const  TextStyle
                        (
                          decoration: TextDecoration.lineThrough,color: Colors.green
                      ) :null,),
                    trailing: Checkbox(
                        value: todos[index].completed,
                        onChanged: (value) => ref
                            .read(todosProvider.notifier)
                            .toggleTodo(todos[index].id, value! )),
                  ));
            })
          ],
        ),
      ),
    );
  }
}

showSnackBar(BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

const snackBar = SnackBar(
  content: Text("todo added successfully",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      )),
);
