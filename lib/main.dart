import 'package:flutter/material.dart';
import 'package:islami/Home/Home_Screen.dart';
import 'package:islami/Home/quran/Sura_Details_Screen.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/Home/Sebha/sebha.dart';

import 'Home/Hadeth/Hadeth_Deatils_Screen.dart';
import 'Home/Hadeth/Hadeth_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: HomeScreen.route,
      routes: {
        HomeScreen.route: (context) => HomeScreen(),
        SuraDetailsScreen.route: (context) => SuraDetailsScreen(),
        HadethDeatilsScreen.route: (context) => HadethDeatilsScreen(),



      },
      darkTheme: MyThemeData.DarkTheme,

      themeMode: ThemeMode.dark,
    );
  }
}
