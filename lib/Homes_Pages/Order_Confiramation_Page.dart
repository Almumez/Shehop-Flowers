import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import '../const/CustomPageRoute.dart';
import '../const/Laoding.dart';
import '../const/constance.dart';
import 'View_Orders_Page.dart';
import 'package:http/http.dart' as http;
class Order_Confiramation_Page extends StatefulWidget {
  final  number;

  final urlName;

  final urlImage;

  Order_Confiramation_Page(  {Key? key,required this.number,required this.urlImage,required this.urlName}) : super(key: key);

  @override
  State<Order_Confiramation_Page> createState() => _Order_Confiramation_PageState();
}

class _Order_Confiramation_PageState extends State<Order_Confiramation_Page> with SingleTickerProviderStateMixin{
  late AnimationController C_lottie;
  final note = TextEditingController();
  int  NOrder=Random().nextInt(10000)*1000;
  String? id= FirebaseAuth.instance.currentUser?.uid;
  String? token;
  @override
  void initState() {
    super.initState();


    var Fmc=FirebaseMessaging.instance;
    Fmc.getToken().then((value) => {
      token=value,
    });

    C_lottie =AnimationController(duration: Duration(seconds: 3), vsync: this);

    C_lottie.addStatusListener((status) {

      if(status==AnimationStatus.completed){

       Navigator.pop(context);
      }

    });
  }


  @override
  void dispose() {
    super.dispose();
    C_lottie.dispose();
  }

  bool isLoding=false;
  @override
  Widget build(BuildContext context) =>
      isLoding ? const Loading()
          :
   Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text('تاكيد الطلب',style: TextStyle(
          fontWeight: FontWeight.bold,),),
        shadowColor: Colors.white,

      ),
      body: 
      SingleChildScrollView(
        child: SafeArea(
          child: Center(
            
            
            
            child: Column(


              children: [

                SizedBox(height: 10,),
                Container(
        color: primaryColor,
                  height: 250,
                  width: 400,

                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.png',
                    image: widget.urlImage,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, url, error) => Center(child: Shimmer.fromColors( highlightColor: Colors.white,
                      baseColor: Colors.grey[300]!, child: Container(color: Colors.red),
                    )),
                    fadeInCurve: Curves.bounceIn,
                    height:200,width: 180,
                  ),
                ),
                SizedBox(height: 30,),
               Text(widget.urlName),
                SizedBox(height: 30,),
                TextFormField(
                  onChanged: (value) {

                  },controller: note,

                  maxLines: 3,

                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,

                  ),
                  decoration: InputDecoration(
                    hintText: "   مثال : تغيير الون -  حذف قطعه - اضافه قطعه",
                    labelText: "  كتابه ملاحظه",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),



                  ),
                ),
                SizedBox(height: 200,),
                Row(children: [
                  SizedBox(width: 20,),
                  ElevatedButton(
                    onPressed: () async{
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey),
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
                        'الغاء',
                        style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 200,),
                  ElevatedButton(
                    onPressed: () async{



                      setState(() => isLoding = true);

                      CollectionReference Collection = FirebaseFirestore.instance.collection("قائمه الطلبات");

                      await Collection.add(
                          {
                            "imgurl":widget.urlImage,
                            "name": widget.urlName,
                            "phoneNumber":widget.number,
                            "note":note.text,
                            "OrderN":NOrder,
                            "Date_Order":DateTime.now().toString(),
                             "token":token,
                             "Order_Status" :1
                          });

                      CollectionReference Collections = FirebaseFirestore
                          .instance.collection("$id"+"Orders");
                      await Collections.add(
                          {
                            "imgurl":widget.urlImage,
                            "name": widget.urlName,
                            "phoneNumber":widget.number,
                            "note":note.text,
                            "OrderN":NOrder,
                            "Date_Order":DateTime.now().toString(),
                            "token":token,
                            "Order_Status":1
                          });
                       sendNatfi("لديك طلب جديد",widget.urlName );
                      await Future.delayed(const Duration(seconds: 10));
                      setState(() => isLoding = false);

                      showDialog(
                          barrierDismissible: false,
                          builder: (BuildContext context) =>
                              Dialog(child: Column ( mainAxisSize: MainAxisSize.min,children: [Lottie.asset("assets/done.json",controller: C_lottie,repeat: true,onLoaded: (compositoin){
                                C_lottie.forward();
                              }),
                              Text("تم ارسال طلبك بنجاج",style: TextStyle(fontSize: 24,),),
                                SizedBox(height: 16,)
                              ])), context: context);

                      await Future.delayed(const Duration(seconds: 4));
                          Navigator.push(
                          context,
                              CustomPageRoute(child:  const View_Orders_Page()));


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
                        'تم',
                        style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )

                ],),


              ],
            ),
          ),
        ),
      ),
    ) ;



  void sendNatfi(String titile,String body) async{
    final serverToken="AAAAJSK38VE:APA91bH9JdbbB2E_dneBvypXrvCrDruGdan2c0r5FJLwRPb02h7IQqBQi22_LvSHeuAhmGBes4M-p8-WNXlCLNbsTa13lnf7l8yGS2G8H40TdjqL32R-Ay9WH85PU9ylTGpvGsIJfyJf";
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send') ,
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': body,
            'title': titile
          },
          'priority': 'high',

          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          },
          'to':"/topics/Admins",
        },
      ),
    );

  }

}


