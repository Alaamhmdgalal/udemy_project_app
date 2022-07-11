import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:udemy_project/layout/home_layout.dart';
import 'package:udemy_project/modules/bmi_result/bmi_result_screen.dart';
import 'package:udemy_project/modules/bmi/bmi_screen.dart';
import 'package:udemy_project/modules/counter/counter_screen.dart';
import 'package:udemy_project/modules/home/home_screen.dart';
import 'package:udemy_project/modules/login/login_screen.dart';
import 'package:udemy_project/modules/messenger/messenger_screen.dart';
import 'package:udemy_project/modules/users/users_screen.dart';
import 'package:udemy_project/shared/bloc_observer.dart';

void main()
{
  BlocOverrides.runZoned(() {
    runApp(MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeLayout(),
    );
  }
}
