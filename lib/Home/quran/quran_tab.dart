import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';
import 'package:islami/Home/quran/Sura_Details_Screen.dart';
import 'package:islami/modele/Sura_Modele.dart';

import '../../Core/Colors/images/images.dart';
import 'Sura_List_Widget.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Image.asset(ImageAssets.logo),
          TextField(
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
                      arguments: SuraModele.getSuraModel(index),
                    );
                  },

                  child: SuraListWidget(
                    suraModele: SuraModele.getSuraModel(index),
                  ),
                );
              },
              itemCount: SuraModele.getSuraItemCount(),
            ),
          ),
        ],
      ),
    );
  }
}
