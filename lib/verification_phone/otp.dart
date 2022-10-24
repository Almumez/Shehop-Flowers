import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:shelhops/const/constance.dart';
import 'package:shelhops/verification_phone/register.dart';
import '../const/Laoding.dart';
import 'LoginController.dart';
class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  LoginController controller=Get.find();
  final otp1 =TextEditingController();
  final otp2 =TextEditingController();
  final otp3 =TextEditingController();
  final otp4 =TextEditingController();
  final otp5 =TextEditingController();
  final otp6 =TextEditingController();
 bool isLoding=false;
  Widget build(BuildContext context) {
    return isLoding ? const Loading()
        :
    Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff7f6fb),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                    clipper:CustomClipperPath(),
                    child:Container(
                      height: 300,
                      width: 500,
                      color: primaryColor ,
                      child: Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.fromLTRB(50, 30, 50, 80),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: AspectRatio(
                                aspectRatio: 16/9,
                                child: Image.asset(
                                  'assets/5.png',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ))),
                    )
                ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 32),
                    child: Column(
                      children: [
                        Text(
                          'تحقق',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          " sms ادخل رمز التحقق الموجود في رساله ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Container(
                          padding: EdgeInsets.all(3.5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _textFieldOTP(first: true, last: false,controller: otp1),
                                  _textFieldOTP(first: false, last: false,controller: otp2),
                                  _textFieldOTP(first: false, last: false,controller: otp3),
                                  _textFieldOTP(first: false, last: false,controller: otp4),
                                  _textFieldOTP(first: false, last: false,controller: otp5),
                                  _textFieldOTP(first: false, last: true,controller: otp6),
                                ],
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async{
                                    controller.verifyOTP(otp1.text+otp2.text+otp3.text+otp4.text+otp5.text+otp6.text,context);
                                    },
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(primaryColor),
                                    shape:
                                        MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24.0),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(14.0),
                                    child: Text(
                                      'تحقق',
                                      style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        InkWell(
                        onTap:()async{
                        await  controller.resend(controller.phoneN,context);},
                          child: Text(
                            "ارسال الكود مره اخرئ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
            ),
          ),
        ),
        );
  }

  Widget _textFieldOTP({bool? first, last, required TextEditingController controller}) {
    return Container(
      height: 70,
      width: 50,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller:controller ,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: primaryColor),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

}
class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w=size.width;
    double h=size.height;

    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height);
    path0.quadraticBezierTo(size.width*0.3994375,size.height*0.7504400,size.width*0.5189500,size.height*0.8056000);
    path0.quadraticBezierTo(size.width*0.8072625,size.height*1.0144800,size.width,size.height*0.9707400);
    path0.lineTo(size.width,size.height*0.0026600);

    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}
