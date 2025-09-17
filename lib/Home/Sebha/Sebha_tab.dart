import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';
import 'package:islami/Core/Colors/images/images.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasbehList = ["سبحان الله", "الحمد لله", "الله أكبر"];
  int counter = 0;

  late String tasbehTitle = tasbehList[0];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Image.asset(
              ImageAssets.logo,
              height: MediaQuery.of(context).size.height * .15,
            ),
          ),
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 41,
              color: AppColors.White,
            ),
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentGeometry.topCenter,
              children: [
                Row(),
                Image.asset(
                  ImageAssets.SebhaHead,
                  height: MediaQuery.of(context).size.height * .14,
                ),
                Positioned.fill(
                  top: MediaQuery.of(context).size.height * .12,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Stack(
                      children: [
                        AnimatedRotation(
                          duration: Duration(milliseconds: 200),

                          turns: counter * (12 / 360),
                          child: GestureDetector(

                            onTap: () {
                              tasbehupdat();
                            },

                            child: Image.asset(
                              ImageAssets.SebhaBody,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Positioned(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(),
                              Text(
                                tasbehTitle,
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.White,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                counter.toString(),
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.White,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void tasbehupdat() {
    counter++;

    if (counter == 34) {
      tasbehTitle = tasbehList[(tasbehList.indexOf(tasbehTitle) + 1) % 3];
      counter = 0;
    }
    setState(() {});
  }
}
