import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';
import 'package:islami/modele/onpoarding_data.dart';

class onPoardingPage extends StatelessWidget {
  final onBoardingData onpoardingdata;

  onPoardingPage({super.key, required this.onpoardingdata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(child: Image.asset(onpoardingdata.imagePath)),
          SizedBox(height: 24),
          Text(
            onpoardingdata.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: AppColors.Gold,
            ),
          ),
          SizedBox(height: 24,),
          if(onpoardingdata.description!=null)

            Text(
              onpoardingdata.description!,textAlign:TextAlign.center ,
              style: TextStyle(

                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.Gold,
              ),
            ),


        ],
      ),
    );
  }
}
