import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_project/shared/components/components.dart';
import 'package:udemy_project/shared/cubit/cubit.dart';
import 'package:udemy_project/shared/cubit/states.dart';

import '../../shared/components/constants.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ToDoAppCubit, ToDoAppStates>(
      builder: (context, state) {
        var tasks = ToDoAppCubit.get(context).newTasks;

        return noTasksBuilder(tasks: tasks);
      },
      listener: (context, state) {},
    );
  }
}
