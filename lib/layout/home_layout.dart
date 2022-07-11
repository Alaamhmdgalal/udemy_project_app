import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_project/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:udemy_project/modules/done_tasks/done_tasks_screen.dart';
import 'package:udemy_project/modules/new_tasks/new_tasks_screen.dart';
import 'package:udemy_project/shared/components/components.dart';
import 'package:udemy_project/shared/cubit/cubit.dart';
import 'package:udemy_project/shared/cubit/states.dart';

import '../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToDoAppCubit()..createDatabase(),
      child: BlocConsumer<ToDoAppCubit, ToDoAppStates>(
        builder: (context, state) {
          ToDoAppCubit cubit = ToDoAppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: state is! ToDoLoadingGetFromDatabaseBar
                ? cubit.screens[cubit.currentIndex]
                : const Center(child: CircularProgressIndicator()),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        elevation: 20.0,
                        (context) => Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(
                            20.0,
                          ),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultTextField(
                                    controller: titleController,
                                    type: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Title can not be empty';
                                      }
                                    },
                                    label: 'Task title',
                                    prefixIcon: Icons.title),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultTextField(
                                    controller: timeController,
                                    type: TextInputType.datetime,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Time can not be empty';
                                      }
                                    },
                                    onTap: () {
                                      showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                          .then((value) {
                                        timeController.text =
                                            value!.format(context);
                                      });
                                    },
                                    label: 'Task time',
                                    prefixIcon: Icons.watch_later_outlined),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                defaultTextField(
                                    controller: dateController,
                                    type: TextInputType.datetime,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Date can not be empty';
                                      }
                                    },
                                    onTap: () {
                                      showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse('2022-07-15'),
                                      ).then((value) {
                                        dateController.text =
                                            DateFormat.yMMMd().format(value!);
                                      });
                                    },
                                    label: 'Task date',
                                    prefixIcon: Icons.calendar_today),
                              ],
                            ),
                          ),
                        ),
                      ).closed.then((value) {
                    cubit.changeBottomSheetState(
                      isShown : false,
                      icon : Icons.edit,
                    );
                  });
                  cubit.changeBottomSheetState(
                      isShown: true,
                      icon: Icons.add);
                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if(state is ToDoInsertInDatabaseBar){
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
