import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';

class DotIndecator extends StatelessWidget {
  bool isActive;

  DotIndecator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width:isActive?34: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isActive?AppColors.Gold:Colors.grey


      ),

    );
  }
}
