import 'package:flutter/material.dart';
import 'package:islami/Home/Home_Screen.dart';
import 'package:islami/Home/quran/Sura_Details_Screen.dart';
import 'package:islami/Home/quran/quran_tab.dart';
import 'package:islami/MyTheme.dart';
import 'package:islami/on_poarding/on_poarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Home/Hadeth/Hadeth_Deatils_Screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isFirstTime = prefs.getBool("FirstTime");
  runApp(MyApp(  isFirstTime: isFirstTime ?? true,));


}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  const MyApp({super.key, required this.isFirstTime});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute:  isFirstTime ? onPoardingScreen.route : HomeScreen.route,
      routes: {
        onPoardingScreen.route: (context) => onPoardingScreen(),
        HomeScreen.route: (context) => HomeScreen(),

        QuranTab.route: (context) => QuranTab(),
        SuraDetailsScreen.route: (context) => SuraDetailsScreen(),
        HadethDeatilsScreen.route: (context) => HadethDeatilsScreen(),



      },
      darkTheme: MyThemeData.DarkTheme,

      themeMode: ThemeMode.dark,
    );
  }
}
