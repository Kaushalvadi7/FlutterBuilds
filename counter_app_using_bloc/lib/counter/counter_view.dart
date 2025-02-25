/*
   responsible for UI

   - use BlocBuilder
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  // Build the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              state.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // increament
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increament(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10,),
          // decrement
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decreament(),
            child: const Icon(Icons.remove ),
          ),
        ],
      ),
    );
  }
}
