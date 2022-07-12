import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_project/layout/news_app/cubit/states.dart';
import 'package:udemy_project/modules/business/business_screen.dart';
import 'package:udemy_project/modules/science/science_screen.dart';
import 'package:udemy_project/modules/settings/settings_screen.dart';
import 'package:udemy_project/modules/sports/sports_screen.dart';
import 'package:udemy_project/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsAppStates>{
  NewsCubit() : super(InitialNewsAppState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
          Icons.business,
      ),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void bottomNavBarChange(int index)
  {
    currentIndex = index;
    emit(BottomNavBarNewsAppState());
  }

  List<dynamic> businessData = [];

  void getBusinessData()
  {
    emit(NewsBusinessLoadingState());
    DioHelper.getData(
        methodUrl: 'v2/top-headlines',
        query: {
          'country' : 'us',
          'category' : 'business',
          'apiKey' : '130ff267146a4cde9d50f3fe722c8ee9',
        }
    ).then((value){
      // print(value.data.toString());
      businessData = value.data['articles'];

      emit(NewsBusinessSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsBusinessFailedState(error.toString()));
    });
  }

  List<dynamic> sportsData = [];

  void getSportsData()
  {
    emit(NewsSportsLoadingState());
    DioHelper.getData(
        methodUrl: 'v2/top-headlines',
        query: {
          'country' : 'us',
          'category' : 'sports',
          'apiKey' : '130ff267146a4cde9d50f3fe722c8ee9',
        }
    ).then((value){
      // print(value.data.toString());
      sportsData = value.data['articles'];

      emit(NewsSportsSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsSportsFailedState(error.toString()));
    });
  }

  List<dynamic> scienceData = [];

  void getScienceData()
  {
    emit(NewsScienceLoadingState());
    DioHelper.getData(
        methodUrl: 'v2/top-headlines',
        query: {
          'country' : 'us',
          'category' : 'science',
          'apiKey' : '130ff267146a4cde9d50f3fe722c8ee9',
        }
    ).then((value){
      // print(value.data.toString());
      scienceData = value.data['articles'];

      emit(NewsScienceSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsScienceFailedState(error.toString()));
    });
  }
}