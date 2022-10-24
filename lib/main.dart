import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelhops/Homes_Pages/About_Page.dart';
import 'package:shelhops/Homes_Pages/Categories_Pages/Categories_Page.dart';
import 'package:shelhops/Homes_Pages/Categories_Pages/View_page2.dart';
import 'package:shelhops/Homes_Pages/Favorite_page.dart';
import 'package:shelhops/Homes_Pages/MainPage.dart';
import 'package:shelhops/Homes_Pages/Points_Of_Sale.dart';
import 'package:shelhops/const/ErrornInternt.dart';
import 'package:shelhops/const/Laoding.dart';
import 'package:shelhops/mnue/mnue.dart';
import 'package:shelhops/verification_phone/LoginController.dart';
import 'package:shelhops/verification_phone/otp.dart';
import 'package:device_preview/device_preview.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'const/constance.dart';
import 'onboarding/introduction_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'verification_phone/register.dart';
import 'package:http/http.dart 'as http;
bool show = true;
var auth = FirebaseAuth.instance;
var phone="";
var  reslet;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true ;
  await Firebase.initializeApp();

  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  final loginController = Get.put(LoginController());
  bool hasInternt=false;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),

      title: 'shelhop',
      //home: View_page2(),      // home: View_page2(),
      home:
     // hasInternt ==false?ErrorInternt():

      auth.currentUser != null
          ? Categories_Page()
          : show
          ? IntroScreen()
          : const Register(),

    );
  }


  @override
  void initState() {
super.initState();
// sendNatfi("almomyz","soft");
// getmesage();
// InternetConnectionChecker().onStatusChange.listen((status) {
//   bool hasInternt =status ==InternetConnectionStatus.connected;
//   setState(() =>this.hasInternt=hasInternt);
// });

  }

void GetToken(){
 var fbm=FirebaseMessaging.instance;
fbm.getToken().then((value) =>
{

  print(value)

});


}

}