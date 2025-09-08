import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';
import 'package:islami/Home/Hadeth/Hadeth_tab.dart';
import 'package:islami/Home/Radio/Radio_tab.dart';
import 'package:islami/Home/Sebha/Sebha_tab.dart';
import 'package:islami/Home/Time/Time_tab.dart';
import 'package:islami/Home/quran/quran_tab.dart';



class HomeScreen extends StatefulWidget {

  static const String route = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String>backgoundImages = [

    "assets/images/QuranBackground.png",

    "assets/images/Hadeth_Background.png",

    "assets/images/sebhaBackground.png",

    "assets/images/Radio_Background (1).png",

    "assets/images/time_Background (1).png",


  ];
  List<Widget>tabs = [

    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),

  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgoundImages[selectedIndex],
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.Gold,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {

              });
            },
            items: [
              BottomNavigationBarItem(
                icon: BuiltItemInBottomNavBar(index: 0, ImageName: "ic_quran")  ,
                label: "Quran",
              ),
              BottomNavigationBarItem(
                icon: BuiltItemInBottomNavBar(index: 1, ImageName: "ic_hadeth")  ,
                label: "Hadeth",
              ),
              BottomNavigationBarItem(
                icon: BuiltItemInBottomNavBar(index: 2, ImageName: "ic_sebha")  ,
                label: "Sebha",
              ),
              BottomNavigationBarItem(
                icon: BuiltItemInBottomNavBar(index: 3, ImageName: "ic_radio")  ,
                label: "Radio",
              ),
              BottomNavigationBarItem(
                icon: BuiltItemInBottomNavBar(index: 4, ImageName: "ic_time")  ,
                label: "Time",
              ),

            ],
          ),
        body: SebhaTab(),




        ),
      ],
    );
  }

  Widget BuiltItemInBottomNavBar(
      {required int index, required String ImageName}) {
    return selectedIndex == index ? Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(66),color: AppColors.Blackbg,


    ),
      
      child: ImageIcon(AssetImage("assets/images/$ImageName.png")),
    ):
        ImageIcon(AssetImage("assets/images/$ImageName.png"));
  }
}
