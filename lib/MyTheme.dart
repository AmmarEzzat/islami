
import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';

class MyThemeData{

 static final ThemeData DarkTheme =ThemeData(
appBarTheme: AppBarTheme(

 centerTitle: true,
 backgroundColor: AppColors.Black,
    iconTheme: IconThemeData(

        color: AppColors.Gold

    )
    ),
    scaffoldBackgroundColor : Colors.transparent,
bottomNavigationBarTheme: BottomNavigationBarThemeData(
 selectedItemColor: AppColors.White,
 unselectedItemColor: AppColors.Black,
 showSelectedLabels: true,
 showUnselectedLabels: false,


 )



 );



}