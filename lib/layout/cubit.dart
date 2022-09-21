import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/states.dart';

import '../modules/business_screen.dart';
import '../modules/science_screen.dart';
import '../modules/setting_screen.dart';
import '../modules/spots_screen.dart';
import '../shared/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)=> BlocProvider.of(context);


  int currentIndex = 0;
  List<Widget> screens = [
    ScienceScreen(),
    SportsScreen(),
    BusinessScreen(),
    SettingsScreen()


  ];
  List<BottomNavigationBarItem> bottomItems=
  [
    BottomNavigationBarItem(icon:Icon(Icons.science_outlined) ,label:'Science' ),
    BottomNavigationBarItem(icon:Icon(Icons.sports_handball_outlined) ,label:'Sports' ),
    BottomNavigationBarItem(icon:Icon(Icons.business_center) ,label:'Business' ),
    BottomNavigationBarItem(icon:Icon(Icons.settings) ,label:'Settings' ),

  ];
  void changeBottomItem(int index)
  {
    currentIndex=index;


    emit(NewsBottomNavState());
  }

  List<dynamic> business=[];
  void getBusinessData()
  {
    emit(NewsGetBusinessLoadingState());
if(business.length==0)
  {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'business',
        'apikey':'66b28b209bec4d15876409dafe141dd0'
      },

    ).then((value)
    {
      business =value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessDataSucessState());
    }).catchError((error)
    {

      print('error is ${error.toString()}');
      emit(NewsGetBusinessDataErrorState(error));
    });
  }else
    {
      emit(NewsGetBusinessDataSucessState());

    }

  }

  List<dynamic> sports=[];
  void getSportsData()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.length==0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apikey':'66b28b209bec4d15876409dafe141dd0'
        },

      ).then((value)
      {
        emit(NewsGetSportsLoadingState());
        sports =value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsDataSucessState());
      }).catchError((error)
      {

        print('error is ${error.toString()}');
        emit(NewsGetSportsDataErrorState(error));
      });
    }
    else
      {
        emit(NewsGetSportsDataSucessState());

      }

  }

  List<dynamic> science=[];
  void getScienceData()
  {
    emit(NewsGetScienceLoadingState());
if(science.length==0)
  {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'science',
        'apikey':'66b28b209bec4d15876409dafe141dd0'
      },

    ).then((value)
    {
      science =value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetScienceDataSucessState());
    }).catchError((error)
    {

      print('error is ${error.toString()}');
      emit(NewsGetScienceDataErrorState(error));
    });
  }else
    {
      emit(NewsGetScienceDataSucessState());

    }

  }

  List<dynamic> settings=[];
  void getSettingsData()
  {

  }

  List<dynamic> search=[];
  void getSearchData(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:{
        'q':'$value',
        'apikey':'66b28b209bec4d15876409dafe141dd0'
      },

    ).
    then((value)
    {

      search =value.data['articles'];
      print(search[0]['title']);
      emit(NewsGetSearchDataSucessState());
    }).catchError((error)
    {

      print('error is ${error.toString()}');
      emit(NewsGetSearchDataErrorState(error));
    });
  }


}