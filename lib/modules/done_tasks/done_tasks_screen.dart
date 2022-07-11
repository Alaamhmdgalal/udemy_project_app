import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_project/shared/components/components.dart';
import 'package:udemy_project/shared/cubit/states.dart';

import '../../shared/cubit/cubit.dart';

class DoneTasksScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoAppCubit, ToDoAppStates>(
      builder: (context, state) {
        var tasks = ToDoAppCubit.get(context).doneTasks;
        return noTasksBuilder(tasks: tasks);
      },
      listener: (context, state) {},
    );
  }
}