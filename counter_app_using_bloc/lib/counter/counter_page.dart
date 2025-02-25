/*

   COUNTER PAGE : Responsible for providing CounterCubit to  CounterView (UI)

    - use BLoc provider
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'counter_view.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // bloc provider
    return BlocProvider(
      create: (context) => CounterCubit(0),
      child: BlocListener<CounterCubit, int>(
        listener: (context, state) {
          // showing pop up to reach at 10
          if (state == 10) {
            showDialog(
              context: context,
              builder:
                  (context) =>
              const AlertDialog(content: Text("you reached 10!")),
            );
          }
        },
        child: const CounterView(),
      ),
    );
  }
}
