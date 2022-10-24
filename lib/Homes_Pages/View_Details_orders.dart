import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/constance.dart';

class View_Details_orders extends StatefulWidget {

  final  number;
  final urlName;
  final urlImage;
  final note;
  final orderN;
  const View_Details_orders( {Key? key,required this.urlName,required  this.number, required this.urlImage,required this.note,required this.orderN,}) : super(key: key);

  @override
  State<View_Details_orders> createState() => View_Details_ordersState();
}

class View_Details_ordersState extends State<View_Details_orders> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text('تفاصيل الطلب',style: TextStyle(
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
                  height: 250,
                  width: 400,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/14.png',
                        image: widget.urlImage,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, url, error) => Center(child: Shimmer.fromColors( highlightColor: Colors.white,
                          baseColor: Colors.grey[300]!, child: Container(color: Colors.red),
                        )),
                        fadeInCurve: Curves.bounceIn,
                        height:200,width: 180,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Text(widget.urlName),
                SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [ Container(
                  height: 100,
                  width: 250,
                  color: primaryColor,

                  child: Text(widget.note,),

                ),Text("-: ملاحظه"),

                ]),

                SizedBox(height: 30,),
                Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                    [
                      SizedBox(width: 20,),
                      Text(widget.orderN),
                      Text("-: رقم الطلب"),
                    ]),





              ],
            ),
          ),
        ),
      ),
    ) ;;
  }




}
