import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shelhops/Homes_Pages/View_Details_orders.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../const/CustomPageRoute.dart';
import '../const/constance.dart';
import '../mnue/mnue.dart';
import 'Categories_Pages/Categories_Page.dart';

class View_Orders_Page extends StatefulWidget {
  const View_Orders_Page({Key? key}) : super(key: key);

  @override
  State<View_Orders_Page> createState() => View_Orders_PageState();
}
class View_Orders_PageState extends State<View_Orders_Page> {

  Query<Map<String, dynamic>> userref = FirebaseFirestore.instance.collection("$id"+"Orders").orderBy("Date_Order",descending: true);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{

        Navigator.push(
            context, CustomPageRoute(child: const Categories_Page()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: primaryColor,
          title: Center(child: Text('قائمه الطلبات',style: TextStyle(
            fontWeight: FontWeight.bold,),)
          ),
          shadowColor: Colors.white,
        ),
        body:Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Categories_Page())),
                child: Icon(
                  Icons.arrow_back,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            StreamBuilder <QuerySnapshot>(stream: userref.snapshots(),builder: (context,snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,itemBuilder: (context, i){
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: primaryColor,
                      backgroundImage:
                      NetworkImage("${snapshot.data!.docs[i]["imgurl"]}") ,
                    ),

                    title: Text("${snapshot.data!.docs[i]["name"]}"),
                    subtitle: Text("${snapshot.data!.docs[i]["OrderN"]}"),



                    onTap: (){
                      Navigator.push(
                          context,
                          CustomPageRoute(child:  View_Details_orders(urlImage:"${snapshot.data!.docs[i]["imgurl"]}", urlName: "${snapshot.data!.docs[i]["name"]}", number: "${snapshot.data!.docs[i]["phoneNumber"]}", orderN: "${snapshot.data!.docs[i]["OrderN"]}", note: "${snapshot.data!.docs[i]["note"]}",)));

                    },
                  );




                },);


              }

              if(snapshot.connectionState == ConnectionState.waiting){
                return ListView.builder(
                  itemCount: 50,itemBuilder: (context, i){
                  return Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey[300]!,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: primaryColor,
                        backgroundImage:
                        AssetImage('assets/14.png'),
                      ),

                      title: Text("laoding"),
                      subtitle: Text("laoding"),



                      onTap: (){
                        Navigator.push(
                            context,
                            CustomPageRoute(child:  View_Details_orders(urlImage:"${snapshot.data!.docs[i]["imgurl"]}", urlName: "${snapshot.data!.docs[i]["name"]}", number: "${snapshot.data!.docs[i]["phoneNumber"]}", orderN: "${snapshot.data!.docs[i]["OrderN"]}", note: "${snapshot.data!.docs[i]["note"]}",)));

                      },
                    ),
                  );




                },);

              }

              if(snapshot.hasError){
                {showTopSnackBar(
                    context,
                    CustomSnackBar.success(
                      message:
                      "يرجئ التحقق من اتصالك في الانترنت",backgroundColor: primaryColor,
                    ));
                }}
              if(!snapshot.hasData){
                return Shimmer.fromColors(
                  highlightColor: Colors.white,
                  baseColor: Colors.grey[300]!,
                  child: ListView.builder(itemCount: snapshot.data!.docs.length,itemBuilder: (context, i){
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundColor: primaryColor,
                        backgroundImage: NetworkImage("${snapshot.data!.docs[i]["imgurl"]}"),
                      ),

                      title: Text("${snapshot.data!.docs[i]["name"]}"),
                      subtitle: Text("${snapshot.data!.docs[i]["OrderN"]}"),
                    );

                  },),
                );
              }
              return Text("ok");
            }, ),
          ],
        ),

      ),
    );
  }
}
