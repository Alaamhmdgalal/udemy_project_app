import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_project/layout/news_app/cubit/cubit.dart';
import 'package:udemy_project/layout/news_app/cubit/states.dart';
import 'package:udemy_project/shared/components/components.dart';

class SearchScreen extends StatelessWidget
{
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsAppStates>(
      listener: (context, state){},
      builder: (context, state) {
        var list = NewsCubit.get(context).searchData;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextField(
                    controller: searchController,
                    type: TextInputType.text,
                    onChange: (value)
                    {
                      NewsCubit.get(context).getSearchData(value);
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty){
                        return 'Type anything';
                      }
                    },
                    label: 'Search',
                    prefixIcon: Icons.search),
              ),
              Expanded(
                  child: newsArticles(
                      list,
                      context,
                  isSearch: true,
                  ),
              ),
            ],
          ),
        );
      },
    );
  }

}