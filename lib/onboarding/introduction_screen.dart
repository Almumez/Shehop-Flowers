import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelhops/verification_phone/register.dart';
import '../const/CustomPageRoute.dart';
import '../const/constance.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({ Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'مرحبا بك ',
      body: 'كل ماتحتاجه من هدايا موجود',
      footer: SizedBox(
        height: 45,
        width: 300,
      ),
      image: Center(
        child: Lottie.asset("assets/Rose.json",width: 250,),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        )
      )
    ),
    PageViewModel(
        title: 'جميع انواع الهدايا ',
        body: '  هدايا زواج - هدايا العائله - هدايا اعياد الميلاد - وجميع انواع المناسبات  ',
        footer: SizedBox(
          height: 45,
          width: 300,

        ),
        image: Center(
          child: Lottie.asset("assets/boxes.json",width: 250,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
    PageViewModel(
        title: 'انت عليك المناسبه',
        body: 'واحنا علينا الهدية',
        footer: SizedBox(
          height: 45,
          width: 300,

        ),
        image: Center(
          child: Lottie.asset("assets/1.json",width: 250,),
        ),
        decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            )
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15,15),
            color: Colors.black12,
            activeSize: Size.square(20),
            activeColor: primaryColor,
          ),
          showDoneButton: true,
          done: const Text('ابدأ', style: TextStyle(fontSize: 20,color: primaryColor,fontWeight: FontWeight.bold),),
          showSkipButton: true,
          skip: const Text('تخطي', style: TextStyle(fontSize: 20,color: primaryColor,fontWeight: FontWeight.bold),),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward, size: 25,color: primaryColor),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context,
        CustomPageRoute(  child:  const Register()));
  }
}

