/*
  Cubit : Simplefied version of BLoc  for easy state management

  creating our own cubit.

*/
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit  extends Cubit<int>{

  // constructor : get initial state
  CounterCubit(super.initialState);

  // increament
  void increament() => emit(state +1);
  // decreament
  void decreament() => emit(state -1);
}