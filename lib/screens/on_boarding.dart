import 'package:ecommerce/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/circle_progress_bar.dart';
import 'package:intro_screen_onboarding_flutter/intro_app.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
//import 'package:iti_final_project/screens/login.dart';





class onBoarding extends StatelessWidget {
  final List<Introduction> list = [
    Introduction(
      title: 'Buy from Brands',
      subTitle: 'Discover, buy your favorite brands anywhere now',
      imageUrl: 'assets/images/onboarding1.jpg',
    ),
    Introduction(
      title: 'Enjoy Shopping',
      subTitle: 'Indulge in the latest fashion trends anywhere ',
      imageUrl: 'assets/images/finish2.jpg',
    ),
    Introduction(
      title: 'Finish',
      subTitle: 'get started now and order directly from the application',
      imageUrl: 'assets/images/finish1.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreenOnboarding(
      introductionList: list,
      backgroudColor: Colors.white,
      onTapSkipButton: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}