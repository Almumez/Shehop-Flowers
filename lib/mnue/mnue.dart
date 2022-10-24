import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shelhops/Homes_Pages/About_Page.dart';
import 'package:shelhops/Homes_Pages/Categories_Pages/Categories_Page.dart';
import 'package:shelhops/Homes_Pages/Favorite_page.dart';
import 'package:shelhops/Homes_Pages/MainPage.dart';
import 'package:shelhops/Homes_Pages/Points_Of_Sale.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shelhops/Homes_Pages/View_Orders_Page.dart';
import 'package:shelhops/const/CustomPageRoute.dart';
import '../const/constance.dart';
import '../verification_phone/register.dart';
String? id= FirebaseAuth.instance.currentUser?.uid;
class mnue extends StatelessWidget {

  const mnue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
   child: ListView(
     padding: EdgeInsets.zero
       ,children: [
     UserAccountsDrawerHeader(accountName: Text("shelhop"), accountEmail: Text("shelhop.gmail.com"),arrowColor: primaryColor,currentAccountPicture: CircleAvatar(
       child: ClipOval(
         child: Image.asset('assets/logo_.png',fit: BoxFit.cover,width: 90,height: 90,),
       ),
     )
       ,decoration: BoxDecoration(color: primaryColor),
       ),
     ListTile(
               focusColor: primaryColor,
       leading: Icon(Icons.dashboard),
       title: Text(" القائمه الرئيسيه"),
       onTap :()=>Navigator.push(
           context,
    CustomPageRoute(  child: const Categories_Page()))
     ),
             ListTile(
               leading: Icon(Icons.favorite),
               title: Text("المفضله"),
               onTap:()=>Navigator.push(
                   context,
                   CustomPageRoute(child: Favorte_page()))
             ),
             ListTile(
       leading: Icon(Icons.add_business),
       title: Text("نقاط البيع"),
        onTap: ()=>Navigator.push(
            context,
            CustomPageRoute(  child:  FlipCardExample()))
     ),
             ListTile(
       leading: Icon(Icons.share),
       title: Text("مشاركه التطبيق"),
       onTap: ()async{
         await Share.share("PlayStore.shelhop.com");
       },
     ),
             ListTile(
       leading: Icon(Icons.star),
       title: Text("عنا"),
        onTap: ()=>Navigator.push(
            context,
            CustomPageRoute(  child: const About_Page()))
     ),
     ListTile(
         leading: Icon(Icons.add_shopping_cart),
         title: Text("قائمه الطلبات"),
         onTap: ()=>Navigator.push(
             context,
             CustomPageRoute(  child: const View_Orders_Page()))
     ),

   ]),

    );
  }
}
