import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_project/layout/news_app/cubit/cubit.dart';
import 'package:udemy_project/layout/news_app/cubit/states.dart';
import 'package:udemy_project/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessData(),
      child: BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                  'News App',
              ),
              actions: [
                IconButton(
                    onPressed: (){

                    },
                    icon: const Icon(
                        Icons.search)
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.bottomNavBarChange(index);
              },
              items: cubit.bottomItems,
            ),
          );
        }
      ),
    );
  }

}