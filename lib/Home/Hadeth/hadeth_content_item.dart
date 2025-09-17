import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';

class HadethContentItem extends StatelessWidget {
  String content;


  HadethContentItem({super.key, required this.content, });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(vertical: 4,horizontal: 20) ,
      padding: EdgeInsets.symmetric(vertical: 10),


      child: Text(
        content,

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
