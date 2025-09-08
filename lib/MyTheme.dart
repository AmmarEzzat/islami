
import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';

class MyThemeData{

 static final ThemeData DarkTheme =ThemeData(

    scaffoldBackgroundColor : Colors.transparent,
bottomNavigationBarTheme: BottomNavigationBarThemeData(
 selectedItemColor: AppColors.White,
 unselectedItemColor: AppColors.Black,
 showSelectedLabels: true,
 showUnselectedLabels: false,

)

 );



}