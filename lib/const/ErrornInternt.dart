import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shelhops/main.dart';

import 'CustomPageRoute.dart';
import 'constance.dart';

class ErrorInternt extends StatefulWidget {
  const ErrorInternt({Key? key}) : super(key: key);

  @override
  State<ErrorInternt> createState() => _ErrorInterntState();
}

class _ErrorInterntState extends State<ErrorInternt> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(children: [
          SizedBox(height: 100,),
          Lottie.asset("assets/internt.json",width: 250,),
          SizedBox(height: 100,),

          Text("يرجئ التحقق من الانترنت ",style: TextStyle(fontSize: 25,),),
          SizedBox(height: 50,),
          ElevatedButton(
            onPressed: () async{
              Navigator.push(
                  context,
                  CustomPageRoute(child:   const MyApp()));

            },

            style: ButtonStyle(

              foregroundColor:
              MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
              MaterialStateProperty.all<Color>(primaryColor),
              shape:
              MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),

                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'تحديث',
                style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
