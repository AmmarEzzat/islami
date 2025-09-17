import 'package:flutter/material.dart';
import 'package:islami/Core/Colors/AppColors.dart';
import 'package:islami/Home/Hadeth/hadeth_content_item.dart';
import 'package:islami/modele/Hadeth_Modele.dart';

class HadethDeatilsScreen extends StatelessWidget {

  static const String route = "HadethDeatilsScreen";

  const HadethDeatilsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as HadethModele;
    return Scaffold(appBar: AppBar(),

      body: Stack(
        alignment: Alignment.center,
        children: [
        Container(
        color: AppColors.Black,
        child: Image.asset(
          "assets/images/details_Screen.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: 45, width: 65),
      Column(
        children: [
        Text(
        args.title,
        style: TextStyle(
          color: AppColors.Gold,
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),
      ),
      const SizedBox(height: 30,),

      Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return HadethContentItem(content: args.content[index],);
          },
          itemCount: args.content.length,
        ),
      ),

    ],
    ),
    ],
    ),

    );
  }
}
