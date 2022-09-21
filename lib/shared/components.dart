import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../cubit/cubit.dart';
import '../modules/web_view_screen.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required  function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,

      ),

    );

Widget defaultFormField({
   TextEditingController? controller,
   TextInputType? type,
   onSubmit,
   onChange,
   onTap,
  bool isPassword = false,
   validate,
  required String? label,
  String? hint,
  IconData? prefix,
  IconData? suffix,
  suffixPressed,
  required double raduis,
  bool isClickable = true,  IconData? prefixIcon,  IconData? suffixIcon,  Null Function(dynamic value)? onFieldSubmitted,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(color: Colors.grey,
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(raduis,)),
      ),
    );



Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget buildArticleItem(article, context) => InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children:

      [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0,),

            image: DecorationImage(

              image: NetworkImage('${article['urlToImage']}'),

              fit: BoxFit.cover,

            ),

          ),

        ),

        SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children:

              [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),

        SizedBox(

          width: 15.0,

        ),

      ],

    ),

  ),
);

Widget articleBuilder(list, context,{isSearch=false}) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,),
  fallback: (context) =>isSearch? Container(): Center(child: CircularProgressIndicator()),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
navigateAndFinish(context, widget)=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> widget,),
        (route) => false);
Widget themeModeWhite(context)=>Row(children:
[
  Text('Theme Mode',style: TextStyle(fontSize: 20,color: Colors.white))
  ,IconButton(
  onPressed: () {
    AppCubit.get(context).changeAppMode();
  },
  icon: Icon(Icons.brightness_4_outlined,size: 40,color: Colors.white),
)
],);
Widget themeModeBlack(context)=>Row(children:
[
  Text('Theme Mode',style: TextStyle(fontSize: 20,color: Colors.black))
  ,IconButton(
  onPressed: () {
    AppCubit.get(context).changeAppMode();
  },
  icon: Icon(Icons.brightness_4_outlined,size: 40,color: Colors.black),
)
],);





