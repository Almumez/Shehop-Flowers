
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelhops/mnue/mnue.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/CustomPageRoute.dart';
import '../const/constance.dart';
import 'Order_Confiramation_Page.dart';

class Favorte_page extends StatefulWidget {
  const Favorte_page({Key? key}) : super(key: key);

  @override
  State<Favorte_page> createState() => _Favorte_pageState();
}

class _Favorte_pageState extends State<Favorte_page> {

  CollectionReference userref = FirebaseFirestore.instance.collection("$id"+"favorites");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text('المفضله',style: TextStyle(
          fontWeight: FontWeight.bold,),),
        shadowColor: Colors.white,
      ),
      body:  Stack(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: AspectRatio(
                    aspectRatio: 16/9,
                    child: Container(
                      child: Image.asset(
                        'assets/11.png',
                        fit: BoxFit.cover,
                      ),
                    ))

            ),
          ),


          StreamBuilder<QuerySnapshot>(stream:userref.snapshots(),builder: (context,snapshot){
            if(snapshot.hasData){
              return Container(
                padding:EdgeInsets.only(top: 250) ,
                child: GridView.builder(
                    padding: EdgeInsets.all(20),
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,crossAxisSpacing: 20,mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: (){
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) => NetworkGiffyDialog(
                              image: FadeInImage.assetNetwork(
                                placeholder: 'assets/loading.png',
                                image: "${snapshot.data!.docs[i]["imgurl"]}",
                                fit: BoxFit.cover,
                                imageErrorBuilder: (context, url, error) => Center(child: Shimmer.fromColors( highlightColor: Colors.white,
                                  baseColor: Colors.grey[300]!, child: Container(color: Colors.red),
                                )
                                ),
                                fadeInCurve: Curves.bounceIn,
                                height:200,width: 180,
                              ),
                              title: Text("${snapshot.data!.docs[i]["name"]}"),
                              onOkButtonPressed: () async {
                                SharedPreferences share =  await SharedPreferences.getInstance() ;
                                String? phoneNumber=  share.getString("phone");
                                Navigator.pushReplacement(
                                    context,
                                    CustomPageRoute(child:    Order_Confiramation_Page(number: phoneNumber!,urlImage:"${snapshot.data!.docs[i]["imgurl"]}" ,urlName: "${snapshot.data!.docs[i]["name"]}",)));

                              },buttonOkColor: primaryColor,),);

                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: AspectRatio(
                              aspectRatio: 16/9,
                              child: Stack(
                                children: [
                                  FadeInImage.assetNetwork(
                                    placeholder: 'assets/loading.png',
                                    imageErrorBuilder: (context, url, error) => Center(child: Shimmer.fromColors( highlightColor: Colors.white,
                                      baseColor: Colors.grey[300]!, child: Container(color: Colors.red),
                                    )),
                                    image: "${snapshot.data!.docs[i]["imgurl"]}",
                                    fit: BoxFit.cover,
                                    fadeInCurve: Curves.bounceIn,
                                    height:200,width: 180,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      FavoriteButton(isFavorite: true,iconSize: 40,valueChanged:
                                          (_isFavert) async{
                                        if(_isFavert==false){
                                          await   userref.doc(snapshot.data!.docs[i].id).delete();
                                          showTopSnackBar(
                                              context,
                                              CustomSnackBar.success(
                                                message:
                                                "تم الحذف من المفضله بنجاح",backgroundColor: primaryColor,
                                              ));

                                        }
                                        if(_isFavert==true){}

                                      }

                                      )
                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }

            if(snapshot.connectionState == ConnectionState.waiting){
              return Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey[300]!,
                child: Container(
                  padding:EdgeInsets.only(top: 250) ,
                  child:GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2) ,itemCount: 10,itemBuilder: (context ,index){
                    return Container(color: Colors.grey[300]!,);

                  },),
                ),
              );
            }

            if(snapshot.hasError){
              {showTopSnackBar(
                  context,
                  CustomSnackBar.success(
                    message:
                    "يرجئ التحقق من اتصالك في الانترنت",backgroundColor: primaryColor,
                  ));
              }}
            return Text("ok");
          }, ),
        ],
      ),
    );
  }
}
