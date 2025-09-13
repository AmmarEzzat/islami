import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';
import 'package:islami/module/Sura_Modele.dart';

class SuraListWidget extends StatelessWidget {
 SuraModele suraModele;

  SuraListWidget({
    super.key,
    required this.suraModele
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/number_sura-1.png"),
            Text(
              "${suraModele.index+1}",
              style: TextStyle(
                color: AppColors.White,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),SizedBox(width: 24,),
        Expanded(
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   suraModele.suraEnName,
                    style: TextStyle(
                      color: AppColors.White,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    "${suraModele.numOfVerses} Verses",
                    style: TextStyle(
                      color: AppColors.White,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Text(
          suraModele.suraArName,
          style: TextStyle(
            color: AppColors.White,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
