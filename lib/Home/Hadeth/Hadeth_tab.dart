import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Core/Colors/AppColors.dart';
import 'package:islami/Core/Colors/images/images.dart';
import 'package:islami/Home/Hadeth/Hadeth_Deatils_Screen.dart';
import 'package:islami/modele/Hadeth_Modele.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModele> hadethList = [];
  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }
  @override
  Widget build(BuildContext context) {
    if (hadethList.isEmpty) {

      return const Center(
        child: CircularProgressIndicator(color: AppColors.Gold),
      );
    }
    return Column(
      children: [
        Image.asset(ImageAssets.logo),
        CarouselSlider.builder(
          itemCount: hadethList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
              InkWell(onTap: () {
                Navigator.pushNamed(
                    context, HadethDeatilsScreen.route, arguments:hadethList[itemIndex]);
              },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.Gold,
                    image: DecorationImage(
                      image: AssetImage("assets/images/hadeth_bg_image.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          hadethList[itemIndex].title,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              hadethList[itemIndex].content.join(" "),
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          options: CarouselOptions(
            height: 700,
            viewportFraction: .75,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    for (int i = 1; i <= 50; i++) {
      String HadethContent = await rootBundle.loadString(
        "assets/files/Hadeeth/h$i.txt",
      );

      List<String> HadetLines = HadethContent.split("\n");
      for (int i = 0; i < HadetLines.length; i++) {
        print(HadetLines[i]);
      }
      String title = HadetLines[0];
      HadetLines.removeAt(0);
      HadethModele hadethModel = HadethModele(
        title: title,
        content: HadetLines,
      );
      hadethList.add(hadethModel);
    }
    setState(() {});
  }
}
