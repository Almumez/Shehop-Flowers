import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelhops/const/Laoding.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:shelhops/mnue/mnue.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:shelhops/verification_phone/register.dart';
import '../../const/CustomPageRoute.dart';
import '../../const/constance.dart';
import 'package:carousel_pro/carousel_pro.dart';

import '../Order_Confiramation_Page.dart';
class Categories_Page extends StatefulWidget {
  const Categories_Page({Key? key}) : super(key: key);

  @override
  Categories_PageState createState() => Categories_PageState();
}

class Categories_PageState extends State<Categories_Page> {

  String? id= FirebaseAuth.instance.currentUser?.uid;
  final GlobalKey<ScaffoldState> scaffledkey=GlobalKey<ScaffoldState>();
  var name;
  var image =false;
  bool isLoding=false;
  var imgname;
  List<String> images = ["jhjhjhj"];
  var  gride;
  Query<Map<String, dynamic>> userref = FirebaseFirestore.instance.collection("NEWS").orderBy("entery_date",descending: true);

 var  Categries=Text(
  "المنتجات",
  textDirection: TextDirection.rtl,
  style: TextStyle(
  fontSize: 20,
  ),
  );

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("تنبيه"),
                content: Text("هل انت متاكد من انك تريد الخروج"),
                actions: [
                  ElevatedButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text("خروج"),
                  ),
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text("لا"))
                ],
              );
            });

        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }

}

      ,
      child: Scaffold(
        key: scaffledkey,
        drawer: mnue(),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text('القائمه الرئيسية'),
          shadowColor: Colors.white,
        ),
        body: SafeArea(
          child:   ListView(
            children: [

              // Start Carousel
              Container(
                height: 250,
                width: 100,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: AspectRatio(
                    aspectRatio: 16/9,
                    child: Carousel(
                      dotSpacing: 15.0,
                      dotSize: 6.0,

                      dotIncreasedColor: primaryColor,
                      dotBgColor: Colors.transparent,
                      indicatorBgPadding: 10.0,
                      dotPosition: DotPosition.topCenter,
                      images: images
                          .map((item) => Container(
                        child: FadeInImage.assetNetwork(
                          imageErrorBuilder: (context, url, error) =>
                              Center(child: Shimmer.fromColors( highlightColor: Colors.white,
                                baseColor: Colors.grey[300]!, child: Container(color: Colors.red),
                              )),
                          fit: BoxFit.cover, placeholder: 'assets/loading.png', image: item,
                        ),
                      ))
                          .toList(),
                    ),
                  ),
                ),
              ),
// end Carousel


// Start Categories
          Container(padding: EdgeInsets.only(top: 20,right: 20),child: Text("الاقـسـام",textDirection: TextDirection.rtl,style: TextStyle(fontSize: 20,),)),
              Container(margin: EdgeInsets.only(top: 10),height: 100,child: ListView(scrollDirection:Axis.horizontal,children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      userref = FirebaseFirestore.instance.collection("NEWS").orderBy("entery_date",descending: true);
                      Categries=Text(
                        "جديدنا",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      );
                    });

                  },
                  child: Container(height: 120,width: 120,child:
                  ListTile(title: Container( margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: AspectRatio( aspectRatio: 16/9,child: Image.asset('assets/New.png',fit: BoxFit.cover
                        ,)))),subtitle: Text("جديدنا",textAlign: TextAlign.center,),
                  ),






                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      userref = FirebaseFirestore.instance.collection("باقات ومسكات ورد").orderBy("entery_date",descending: true);
                      Categries=Text(
                        "باقات ومسكات ورد",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      );
                    });

                  },
                  child: Container(height: 120,width: 120,child:
                  ListTile(title: Container( margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: AspectRatio( aspectRatio: 16/9,child: Image.asset('assets/flower.jpg',fit: BoxFit.cover
                        ,)))),subtitle: Text("باقات ومسكات ورد",textAlign: TextAlign.center,),
                  ),






                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      userref = FirebaseFirestore.instance.collection("بـاقات شوكلاته").orderBy("entery_date",descending: true);
                      Categries=Text(
                        "بـاقات شوكلاته",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      );
                    });

                  },
                  child: Container(height: 120,width: 120,child:
                  ListTile(title: Container( margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: AspectRatio( aspectRatio: 16/9,child: Image.asset('assets/package.png',fit: BoxFit.cover
                        ,)))),subtitle: Text("بـاقات شوكلاته",textAlign: TextAlign.center,),
                  ),






                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      userref = FirebaseFirestore.instance.collection("باقات ميك اب").orderBy("entery_date",descending: true);
                      Categries=Text(
                        "باقات ميك اب",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      );
                    });

                  },
                  child: Container(height: 120,width: 120,child:
                  ListTile(title: Container( margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: AspectRatio( aspectRatio: 16/9,child: Image.asset('assets/make-up.jpg',fit: BoxFit.cover
                        ,)))),subtitle: Text("باقات ميك اب",textAlign: TextAlign.center,),
                  ),






                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      userref = FirebaseFirestore.instance.collection("نحت وخط").orderBy("entery_date",descending: true);
                      Categries=Text(
                        "نحت وخط",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      );
                    });

                  },
                  child: Container(height: 120,width: 120,child:
                  ListTile(title: Container( margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: AspectRatio( aspectRatio: 16/9,child: Image.asset('assets/font_gift.jpg',fit: BoxFit.cover
                        ,)))),subtitle: Text("نحت وخط",textAlign: TextAlign.center,),
                  ),






                  ),
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      userref = FirebaseFirestore.instance.collection("تحف وهدايا واكسوارات").orderBy("entery_date",descending: true);;
                      Categries=Text(
                        "تحف وهدايا واكسوارات",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      );
                    });

                  },
                  child: Container(height: 120,width: 120,child:
                  ListTile(title: Container( margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: AspectRatio( aspectRatio: 16/9,child: Image.asset('assets/antiques.jpg',fit: BoxFit.cover
                        ,)))),subtitle: Text("تحف وهدايا واكسوارات",textAlign: TextAlign.center,),
                  ),






                  ),
                ),











              ]),

              ),

// end Categories
















// Start gridView
              Container(padding: EdgeInsets.only(top: 20,right: 20),child: Categries),
            Container(
                height: 550,
                child: StreamBuilder<QuerySnapshot>(stream: userref.snapshots(),builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Container(

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
                                      // const String  num="+967776661971";
                                      // String urlimage="${snapshot.data!.docs[i]["imgurl"]}";
                                      // var url='https://wa.me/$num?text=$urlimage';
                                      // await launch(url);

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
                                          image: "${snapshot.data!.docs[i]["imgurl"]}",
                                          fit: BoxFit.cover,
                                          imageErrorBuilder: (context, url, error) => Center(child: Shimmer.fromColors( highlightColor: Colors.white,
                                            baseColor: Colors.grey[300]!, child: Container(color: Colors.red),
                                          )
                                          ),
                                          fadeInCurve: Curves.bounceIn,
                                          height:200,width: 180,
                                        )
                                        ,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            FavoriteButton(isFavorite: false,iconSize: 40,valueChanged:
                                                (_isFavert) async{
                                              if(_isFavert==false){}
                                              if(_isFavert==true){
                                                try {
                                                  CollectionReference Collection = FirebaseFirestore
                                                      .instance.collection("$id"+"favorites");
                                                  await Collection.add(
                                                      {
                                                        "imgurl":"${snapshot.data!.docs[i]["imgurl"]}",
                                                        "name": "${snapshot.data!.docs[i]["name"]}",
                                                      });

                                                  showTopSnackBar(
                                                      context,
                                                      CustomSnackBar.success(
                                                        message:
                                                        "تم الاضافه الئ المفضله ",backgroundColor: primaryColor,
                                                      ));
                                                }

                                                catch (e) {
                                                  showTopSnackBar(
                                                      context,
                                                      CustomSnackBar.success(
                                                        message:
                                                        "يرجئ التاكد من انك متصل في الانترنت",backgroundColor: primaryColor,
                                                      ));
                                                }
                                              }

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
              ),


// end gridView



            ],

          ),

        ),
      ),
    );


  }
  @override
  void initState() {

    getspachel();
  }



  getspachel()async
  {
    CollectionReference userref = FirebaseFirestore.instance.collection("العروض");
    try {
      var reponsbody = await userref.get();
      reponsbody.docs.forEach((element) {
        setState(() {
          images.add(element.data().toString().replaceAll("{imgurl: ", ""));
        });
      });
      setState(() =>isLoding=true);
    } catch (e) {
      showTopSnackBar(
          context,
          CustomSnackBar.info(
            message:
            "يرجئ التاكد من انك متصل في الانترنت",backgroundColor: primaryColor,
          ));

    }

  }
}
