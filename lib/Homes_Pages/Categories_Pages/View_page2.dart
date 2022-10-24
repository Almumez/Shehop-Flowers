import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
import '../../const/constance.dart';
import 'package:carousel_pro/carousel_pro.dart';

import '../Order_Confiramation_Page.dart';
class View_page2 extends StatefulWidget {
  const View_page2({Key? key}) : super(key: key);

  @override
  _ViewStat createState() => _ViewStat();
}

class _ViewStat extends State<View_page2> {

  String? id= FirebaseAuth.instance.currentUser?.uid;
  final GlobalKey<ScaffoldState> scaffledkey=GlobalKey<ScaffoldState>();
  var name;
  var image =false;
  bool isLoding=false;
  var imgname;
   List<String> images = [];
  CollectionReference userref = FirebaseFirestore.instance.collection("باقات ومسكات ورد");

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffledkey,
      drawer: mnue(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('باقات شوكولاته'),
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child:   Stack(
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
                fit: BoxFit.cover, placeholder: 'assets/14.png', image: item,
              ),
            ))
                .toList(),
          ),
        ),
      ),
    ),



   Padding(

     padding: const EdgeInsets.only(top: 220),
     child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 4,itemBuilder: (context,i){
       return Text("data");
     }),
   ),



    StreamBuilder<QuerySnapshot>(stream: userref.snapshots(),builder: (context,snapshot){
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
    image: Image.network(
    "${snapshot.data!.docs[i]["imgurl"]}",
    fit: BoxFit.fill,
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
          MaterialPageRoute(builder: (context) =>   Order_Confiramation_Page(number: phoneNumber!,urlImage:"${snapshot.data!.docs[i]["imgurl"]}" ,urlName: "${snapshot.data!.docs[i]["name"]}",)));




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
       placeholder: 'assets/14.png',
       image: "${snapshot.data!.docs[i]["imgurl"]}",
       fit: BoxFit.cover,
        imageErrorBuilder: (context, url, error) => Center(child: Shimmer.fromColors( highlightColor: Colors.white,
  baseColor: Colors.grey[300]!, child: Container(color: Colors.red),
)),
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
      child:  Stack(
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
                child:Carousel(




                  dotSpacing: 15.0,
                  dotSize: 6.0,
                  dotIncreasedColor: primaryColor,
                  dotBgColor: Colors.transparent,
                  indicatorBgPadding: 10.0,
                  dotPosition: DotPosition.topCenter,
                  images: images
                      .map((item) => Container(
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                    ),
                  ))
                      .toList(),
                ),
              ),
            ),
          )
        ],

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
          return Text("data");
    }

  }
}
