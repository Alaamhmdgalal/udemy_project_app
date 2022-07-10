import 'package:flutter/material.dart';
import 'package:udemy_project/modules/bmi_result/bmi_result_screen.dart';
import 'package:udemy_project/modules/bmi/bmi_screen.dart';
import 'package:udemy_project/modules/counter/counter_screen.dart';
import 'package:udemy_project/modules/home/home_screen.dart';
import 'package:udemy_project/modules/login/login_screen.dart';
import 'package:udemy_project/modules/messenger/messenger_screen.dart';
import 'package:udemy_project/modules/users/users_screen.dart';

void main()
{
  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
  
}
