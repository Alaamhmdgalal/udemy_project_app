import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:udemy_project/layout/news_app/news_layout.dart';
import 'package:udemy_project/layout/todo_app/todo_layout.dart';
import 'package:udemy_project/modules/bmi_result/bmi_result_screen.dart';
import 'package:udemy_project/modules/bmi/bmi_screen.dart';
import 'package:udemy_project/modules/counter/counter_screen.dart';
import 'package:udemy_project/modules/home/home_screen.dart';
import 'package:udemy_project/modules/login/login_screen.dart';
import 'package:udemy_project/modules/messenger/messenger_screen.dart';
import 'package:udemy_project/modules/users/users_screen.dart';
import 'package:udemy_project/shared/bloc_observer.dart';
import 'package:udemy_project/shared/network/remote/dio_helper.dart';

void main()
{
  DioHelper.init();
  BlocOverrides.runZoned(() {
    runApp(MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber,
          elevation: 20.0,
        ),
      ),
      home: NewsLayout(),
    );
  }
}
