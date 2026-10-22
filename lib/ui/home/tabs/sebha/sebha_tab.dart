import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});


  @override
  State<SebhaTab> createState() => _SebhaTabState();

}

class _SebhaTabState extends State<SebhaTab> {
  int counter =0;
  double angle = 0;
  final List<String> azkar =["سبحان الله ","الحمد لله","الله اكبر"];
  int index =0;
  void on_click (){
    setState(() {
      counter++;
      angle+=1/30;

    });

    if (counter==34){
      counter=0;
      index++;
      if (index>2){
        index=0;
      }
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Image.asset("assets/images/sebha_back.png"),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/Logo.png",
                    width: MediaQuery.sizeOf(context).width * 0.7,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                    style: TextStyle(
                      color: ColorsManager.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                    ),
                  ),
                  SizedBox(height: 16),
                  Image.asset(
                    "assets/images/sebha_head.png",
                    width: MediaQuery.sizeOf(context).width * 0.32,
                  ),
                  InkWell(
                    onTap: on_click,
                    child: Stack(
                      alignment: .center,
                      children: [
                        AnimatedRotation(

                          turns: angle,
                       duration: Duration(milliseconds: 200),
                          child: Image.asset(
                            "assets/images/SebhaBody 1.png",
                            width: MediaQuery.sizeOf(context).width * 0.9,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              azkar[index],
                              style: TextStyle(
                                color: ColorsManager.whiteColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              counter.toString(),
                              style: TextStyle(
                                color: ColorsManager.whiteColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
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
    );
  }
}
