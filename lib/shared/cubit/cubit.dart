import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_project/shared/cubit/states.dart';

import '../../modules/archived_tasks/archived_tasks_screen.dart';
import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../modules/new_tasks/new_tasks_screen.dart';

class ToDoAppCubit extends Cubit<ToDoAppStates>
{
  ToDoAppCubit() : super(InitialToDoState());
  static ToDoAppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeIndex(int index){
    currentIndex = index;
    emit(ToDoAppNavBar());
  }

  void createDatabase(){
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        print('Created');
        database
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)')
            .then((value) {
          print('Table is created');
        }).catchError((error) {
          print('Error when creating table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
      },
    ).then((value){
      database = value;
      emit(ToDoCreateDatabaseBar());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) async {
      txn.rawInsert(
          'INSERT INTO tasks(title, time, date, status) VALUES ("$title", "$time", "$date", "New")'
      ).then((value)
      {
        print('$value inserted successfully');
        emit(ToDoInsertInDatabaseBar());

        getDataFromDatabase(database);
      }).catchError((error) {
        print('Error when inserting new record ${error}');
      });
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    emit(ToDoLoadingGetFromDatabaseBar());

    database.rawQuery('SELECT * FROM tasks').then((value) {

      value.forEach((element)
      {
        if(element['status'] == 'New')
          newTasks.add(element);
        else if(element['status'] == 'Done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });

      emit(ToDoGetFromDatabaseBar());
    });
  }

  void changeBottomSheetState({
   required bool isShown,
    required IconData icon,
  })
  {
    isBottomSheetShown = isShown;
    fabIcon = icon;
    emit(ToDoBottomSheetState());
  }

  void updateTaskStatus({
  required String status,
    required int id,
}) async
  {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', '$id'],
    ).then((value)
    {
      getDataFromDatabase(database);
      emit(ToDoUpdateDatabase());
    });
  }

  void deleteTask({
  required int id,
  })
  {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).
    then((value)
    {
      getDataFromDatabase(database);
      emit(ToDoDeleteDatabase());
    });
  }

}