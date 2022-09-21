import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/states.dart';
import '../cubit/cubit.dart';
import '../modules/search.dart';
import '../shared/components.dart';
import 'cubit.dart';



class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit.get(context);

            return Scaffold(
                body: cubit.screens[cubit.currentIndex],
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: () {
                        navigateTo(
                          context,
                          SearchScreen(),
                        );
                      },
                      icon: Icon(Icons.search),
                    ),
                    IconButton(
                      onPressed: () {
                        AppCubit.get(context).changeAppMode();
                      },
                      icon: Icon(Icons.brightness_4_outlined),
                    )
                  ],
                ),

                bottomNavigationBar: BottomNavigationBar(currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeBottomItem(index);
                    },
                    items: cubit.bottomItems
                ),
            );
          },

    );
  }
}
