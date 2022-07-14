import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:udemy_project/layout/news_app/cubit/cubit.dart';
import 'package:udemy_project/layout/news_app/cubit/states.dart';
import 'package:udemy_project/layout/news_app/news_layout.dart';
import 'package:udemy_project/layout/todo_app/todo_layout.dart';
import 'package:udemy_project/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:udemy_project/shared/bloc_observer.dart';
import 'package:udemy_project/shared/cubit/cubit.dart';
import 'package:udemy_project/shared/cubit/states.dart';
import 'package:udemy_project/shared/network/local/cache_helper.dart';
import 'package:udemy_project/shared/network/remote/dio_helper.dart';
import 'package:udemy_project/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  // bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  bool? isDark = false;

  BlocOverrides.runZoned(() {
    runApp(MyApp(isDark!));
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusinessData()
            ..getSportsData()
            ..getScienceData(),
        ),
        BlocProvider(
          create: (context) => ToDoAppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ToDoAppCubit, ToDoAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ToDoAppCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
