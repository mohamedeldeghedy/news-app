import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../layout/cubit.dart';
import '../layout/states.dart';


class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {


        return Scaffold(
          appBar: AppBar(

          ),
          body: Row(children:
          [
            Text('Theme Mode',style: TextStyle(fontSize: 20,))
            ,IconButton(
              onPressed: () {
                AppCubit.get(context).changeAppMode();
              },
              icon: Icon(Icons.brightness_4_outlined,size: 40),
            )
          ]),
        );
      },
    );
  }

}