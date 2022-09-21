
// List<dynamic> search=[];
// void getSearchData(String value)
// {
//   emit(NewsGetSearchLoadingState());
//
//   DioHelper.getData(
//     url: 'v2/everything',
//     query:{
//       'q':'$value',
//       'apikey':'66b28b209bec4d15876409dafe141dd0'
//     },
//
//   ).
//   then((value)
//   {
//
//     search =value.data['articles'];
//     print(search[0]['title']);
//     emit(NewsGetSearchDataSucessState());
//   }).catchError((error)
//   {
//
//     print('error is ${error.toString()}');
//     emit(NewsGetSearchDataErrorState(error));
//   });
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/cubit.dart';
import '../layout/states.dart';
import '../shared/components.dart';

class SearchScreen extends StatelessWidget
{
  var searchController=TextEditingController();
  //var article
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children:
            [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  raduis: 15,
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (String? value)
                  {
                    NewsCubit.get(context).getSearchData(value!);
                  },
                  validate: (String? value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'search must not be empty';
                    }
                    return null;
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(child: articleBuilder(list, context,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
