import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/constance.dart';
class About_Page extends StatefulWidget {
  const About_Page({Key? key}) : super(key: key);

  @override
  State<About_Page> createState() => _About_PageState();
}

class _About_PageState extends State<About_Page> {
  final double coverHeight=280;
  final double proofileHight=144;
   String  num="+967776661971";
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: primaryColor,
          title: Center(child: Text('عنا ',style: TextStyle(
            fontWeight: FontWeight.bold,),)
          )),
      
      body:ListView(
        padding: EdgeInsets.only(top: 20,left: 10,right: 10),
        children: <Widget>[

          bulidTop(),
          SizedBox(height: 50,),
          bulidCenter(),
          SizedBox(height: 50,),
          bulidSocial(),




        ],

      )

    );
  }

  Widget bulidTop(){
    final botton=proofileHight/2;
    final  top=coverHeight -proofileHight/2 ;
    return  Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(margin: EdgeInsets.only(bottom: botton),child: buildCoverIMage()),
          Positioned(top: top,
              child: buildPeofileImage()),

        ]);
  }

  Widget buildCoverIMage()=>Container(
    color: Colors.grey,
    child: Image.asset('assets/12.png',width: double.infinity,height: coverHeight,fit: BoxFit.cover),
  );
  Widget buildPeofileImage()=>
      CircleAvatar(
    radius: proofileHight/2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: AssetImage('assets/18.png',),
  );
  Widget bulidCenter()=>Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("عبد الخالق الحرازي",style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
        const SizedBox(height: 16,),
        Text("Flutter & Android Devploment",style: TextStyle(fontSize: 18,height: 1.4),)
        
      ],
      
    ),
  );

  Widget bulidSocial()=>Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [


      bulidSocialIcon(FontAwesomeIcons.facebook,"https://m.facebook.com/profile.php?id=100009155119565&v"),
      const SizedBox(width: 20,),
      bulidSocialIcon(FontAwesomeIcons.whatsapp,'https://wa.me/$num?'),
      const SizedBox(width: 20,),
      bulidSocialIcon(FontAwesomeIcons.phone,"tel:$num"),
      const SizedBox(width: 20,),


    ],

  );
  Widget bulidSocialIcon(IconData icon,url)=>
      Material(
    shape: CircleBorder(),
    clipBehavior: Clip.hardEdge,
    color: Colors.transparent,
    child: CircleAvatar(
      backgroundColor:primaryColor ,
      radius: 25,
      child: InkWell(onTap: ()async{

        await launch(url);

      },child: Center(child: Icon(icon,size: 32,color: Colors.white,),)),
    ),
  );


}
