import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/images/images.dart';

class SebhaView extends StatelessWidget {
  static const String route ="SebhaView";


  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(


      decoration: BoxDecoration(

        image: DecorationImage(image: AssetImage(ImageAssets.SebhaBackGround,),fit: BoxFit.cover)

      ),

    );
  }
}
