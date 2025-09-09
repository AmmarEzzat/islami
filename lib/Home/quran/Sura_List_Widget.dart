import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';

class SuraListWidget extends StatelessWidget {
  int index;
  String suraArName;
  String suraEnName;
  String ayaNumber;

  SuraListWidget({
    super.key,
    required this.index,
    required this.suraArName,
    required this.suraEnName,
    required this.ayaNumber,
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
              "$index",
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
                    suraEnName,
                    style: TextStyle(
                      color: AppColors.White,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  Text(
                    "$ayaNumber Verses",
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
          suraArName,
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
