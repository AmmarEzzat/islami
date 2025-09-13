import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';

class SuraContentItem extends StatelessWidget {
  String content;
  int index;

  SuraContentItem({super.key, required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(vertical: 8,horizontal: 20) ,
      padding: EdgeInsets.symmetric(vertical: 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(

color: AppColors.Gold,

          width: 2,
        ),


      ),
      child: Text(
        "$content[${index + 1}]",
        textDirection: TextDirection.rtl,

        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.Gold,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
    );
  }
}
