import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:islami_c20/core/resources/colors_manager.dart';
import 'package:islami_c20/ui/on_boarding/model/on_boarding_model.dart';
import 'package:islami_c20/core/remote/local/prefs_manager.dart';
import '../../home/screen/home_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/Logo.png",
                width: MediaQuery.sizeOf(context).width * 0.7,
              ),
            ),
            Expanded(
              child: Container(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (page) => setState(() {
                    currentPage = page;
                  }),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final item = OnBoardingModel.pages[index];
                    return Column(
                      spacing: 40,
                      children: [
                        Image.asset(
                          item.image,
                          height: MediaQuery.sizeOf(context).height * 0.45,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          item.title,
                          style: TextStyle(
                            color: ColorsManager.goldColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                        ),
                        if (item.subtitle != null)
                          Text(
                            item.subtitle!,
                            style: TextStyle(
                              color: ColorsManager.goldColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                if (currentPage != 0)
                  TextButton(
                    onPressed: () {
                      pageController.previousPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: ColorsManager.goldColor,
                      ),
                    ),
                  )
                else
                  SizedBox(width: 51),

                DotsIndicator(
                  dotsCount: 5,
                  position: currentPage.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: ColorsManager.goldColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),


                TextButton(
                  onPressed: ()async {
                    final prefs = PrefsManager.prefs;
                    await prefs.setBool('seenOnBoarding', true);
                    if (currentPage != 4) {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    currentPage == 4 ? "Finish" : "Next",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: ColorsManager.goldColor,
                    ),
                  ),
                )

                // else
                 // SizedBox(width: 51,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
