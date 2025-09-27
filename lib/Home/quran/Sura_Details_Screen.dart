import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Home/quran/sura_content_item.dart';
import 'package:islami/modele/Sura_Modele.dart';

import '../../Core/Colors/AppColors.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String route = "SuraDetailsScreen";

  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      var args = ModalRoute.of(context)!.settings.arguments as SuraModele;
      loadSuraFile(args.fileName);
    });
  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModele;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          args.suraEnName,
          style: TextStyle(
            color: AppColors.Gold,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),

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
                args.suraArName,
                style: TextStyle(
                  color: AppColors.Gold,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
const SizedBox(height: 30,),
              Expanded(
                child: verses.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(color: AppColors.Gold),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return SuraContentItem(content: verses[index], index: index,);
                        },
                        itemCount: verses.length,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loadSuraFile(String fileName) async {
    String suraContent = await rootBundle.loadString(
      "assets/files/quran/$fileName",
    );

    List<String> suraLines = suraContent.split("\n");

    for (int i = 0; i < suraLines.length; i++) {
      print(suraLines[i]);


    }

    verses = suraLines;
    setState(() {});
  }
}
