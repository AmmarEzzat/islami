import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';
import 'package:islami/Home/quran/Sura_Details_Screen.dart';
import 'package:islami/modele/Sura_Modele.dart';

import '../../Core/Colors/images/images.dart';
import 'Sura_List_Widget.dart';

class QuranTab extends StatefulWidget {
  static const String route = "QuranTab";

  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModele.suralList.add(
        SuraModele(
          suraEnName: SuraModele.suraEnglishList[i],
          suraArName: SuraModele.suraArabicList[i],
          numOfVerses: SuraModele.numOfVersesList[i],
          fileName: "${i + 1}.txt",

        ),
      );
    }
  }
String searchText=("");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    addSuraList();
  }

  List<SuraModele> filterList = SuraModele.suralList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Image.asset(ImageAssets.logo),
          TextField(style: TextStyle(color: AppColors.White),
            cursorColor: AppColors.White,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.Gold, width: 3),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.Gold, width: 3),
              ),
              prefixIcon: ImageIcon(
                color: AppColors.Gold,
                AssetImage("assets/images/quran-icon_search.png"),
              ),
              hintText: "Sura Name",
              hintStyle: TextStyle(
                color: AppColors.White,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onChanged: (text){

              searchText=text;

           filterList=   SuraModele.suralList.where((suraModel)


              {

                return suraModel.suraArName.contains(searchText)||

               suraModel.suraEnName.toLowerCase().contains(searchText.toLowerCase())  ;


              }
              ).toList();
setState(() {

});
            },
          ),
          SizedBox(height: 20),

          Text(
            "Most Resently",
            style: TextStyle(
              color: AppColors.White,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: AppColors.Gold,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Sura En."),
                    Text("Sura Ar"),
                    Text("Aya Num"),
                  ],
                ),
                Image.asset("assets/images/image_sura.png"),
              ],
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Suras List",
            style: TextStyle(
              color: AppColors.White,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.White,
                  thickness: 2,
                  indent: 30.5,
                  endIndent: 25.5,
                );
              },
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen.route,
                      arguments: filterList[index],
                    );
                  },

                  child: SuraListWidget(
                    index: index,
                    suraModele: filterList[index],
                  ),
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }
}
