import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/cubit.dart';
import '../layout/states.dart';
import '../shared/components.dart';


class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder:(context,state) {
        var list =NewsCubit.get(context).business;
        return ConditionalBuilder(
        condition:list.length>0 ,
        builder:(context)=>ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>buildArticleItem(list[index],context),
            separatorBuilder:(context,index) =>myDivider(),
            itemCount: list.length
        ) ,
        fallback: (context)=>Center(child: CircularProgressIndicator()),
      );
      },


    );
  }
}
