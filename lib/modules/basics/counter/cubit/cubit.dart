import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_project/modules/basics/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitState());

  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 1;

  void minus(){
   counter --;
   emit(CounterMinusState());
  }
  void plus(){
   counter ++;
   emit(CounterPluState());
  }

}