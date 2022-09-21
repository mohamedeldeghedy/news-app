import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/cubit.dart';
import 'package:news/layout/states.dart';
import 'package:news/shared/Bloc_Observer.dart';
import 'package:news/shared/cash_helper.dart';
import 'package:news/shared/dio_helper.dart';
import 'package:news/styles/themes.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'layout/news_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(Platform.isWindows)
  await DesktopWindow.setMinWindowSize(Size(650.0, 650.0)

  );


  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark') ;
  runApp(MyApp(isDark: isDark));

}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp({

    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:
      [
        BlocProvider(
            create: (context) => NewsCubit()..getBusinessData()..getSportsData()..getScienceData(),)
          ,BlocProvider(
          create: (BuildContext context) => AppCubit()
      ..changeAppMode(fromShared: isDark
      ),
          )],

        child: BlocConsumer<AppCubit,AppStates>(
          listener: (context, state) => {},
          builder:(context, state)=> MaterialApp(
                debugShowCheckedModeBanner: false,
theme:lightMode ,
darkTheme:darkMode ,
themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,


                home: NewsLayout()

              ),
        ),

    );


  }
}

