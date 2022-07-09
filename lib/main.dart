import 'package:flutter/material.dart';
import 'package:udemy_project/counter_screen.dart';
import 'package:udemy_project/home_screen.dart';
import 'package:udemy_project/login_screen.dart';
import 'package:udemy_project/messenger_screen.dart';
import 'package:udemy_project/users_screen.dart';

void main()
{
  runApp(MyApp());

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }
  
}
