import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_project/layout/news_app/cubit/cubit.dart';
import 'package:udemy_project/layout/news_app/cubit/states.dart';
import 'package:udemy_project/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var list = NewsCubit.get(context).sportsData;
          return newsArticles(list, context);
        });
  }
}
