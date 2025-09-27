import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/images/images.dart';
import 'package:islami/Home/Home_Screen.dart';
import 'package:islami/Home/quran/quran_tab.dart';
import 'package:islami/modele/onpoarding_data.dart';
import 'package:islami/on_poarding/widgets/dot_indecator.dart';
import 'package:islami/on_poarding/widgets/on_poarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/Colors/AppColors.dart';

class onPoardingScreen extends StatefulWidget {
  static const String route = "onPoardingScreen";

  onPoardingScreen({super.key});

  @override
  State<onPoardingScreen> createState() => _onPoardingScreenState();
}

class _onPoardingScreenState extends State<onPoardingScreen> {
  List<onBoardingData> onPoardingList = [
    onBoardingData(
      imagePath: "assets/images/onpoarding1.png",
      title: "Welcome To Islmi App",
      description: '',
    ),
    onBoardingData(
      imagePath: "assets/images/onpoarding2.png",
      title: "Welcome To Islami",
      description: 'We Are Very Excited To Have You In Our Community',
    ),
    onBoardingData(
      imagePath: "assets/images/onpoarding3.png",
      title: "Reading the Quran",
      description: 'Read, and your Lord is the Most Generous',
    ),
    onBoardingData(
      imagePath: "assets/images/onpoarding4.png",
      title: "Bearish",
      description: 'Praise the name of your Lord, the Most High',
    ),
    onBoardingData(
      imagePath: "assets/images/onpoarding5.png",
      title: "Holy Quran Radio",
      description:
          'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];

  PageController pageController = PageController();

  int currentIndex = 0;

  @override
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Image.asset(
                ImageAssets.logo,
                height: MediaQuery.of(context).size.height * .15,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemBuilder: (context, index) =>
                    onPoardingPage(onpoardingdata: onPoardingList[index]),
                itemCount: onPoardingList.length,
              ),
            ),
            Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: currentIndex != 0
                            ? () {
                                pageController.animateToPage(
                                  currentIndex - 1,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.fastOutSlowIn,
                                );
                              }
                            : null,
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: AppColors.Gold,
                          textStyle: TextStyle(fontSize: 20),
                        ),
                        child: Text("Back"),
                      ),
                      TextButton(
                        onPressed: () {
                          {
                            if (currentIndex == 4) {

                              setOnBoardingDone();
                            } else {
                              pageController.animateToPage(
                                currentIndex + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.fastOutSlowIn,
                              );
                            }
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: AppColors.Gold,
                          textStyle: TextStyle(fontSize: 20),
                        ),
                        child: Text(currentIndex == 4 ? "Finish" : "Next"),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    DotIndecator(isActive: currentIndex == 0),
                    DotIndecator(isActive: currentIndex == 1),
                    DotIndecator(isActive: currentIndex == 2),
                    DotIndecator(isActive: currentIndex == 3),
                    DotIndecator(isActive: currentIndex == 4),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void setOnBoardingDone() async{
SharedPreferences prefrences =await SharedPreferences.getInstance();
await prefrences.setBool("FirstTime", false);
Navigator.pushNamed(context, HomeScreen.route);

  }
}
