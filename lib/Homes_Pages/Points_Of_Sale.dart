import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:shelhops/Homes_Pages/Categories_Pages/Categories_Page.dart';
import 'package:shelhops/Homes_Pages/Categories_Pages/View_page2.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const/constance.dart';
class FlipCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlipCard',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {



  _renderContent(context, String text) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32.0, right: 32.0, top: 20.0, bottom: 0.0),
      color: primaryColor,
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset('assets/5.png',fit: BoxFit.fill),
              ),
              SizedBox(height: 10,),
              Text(" :اضغط لمعرفه التفاصيل ")
            ],
          ),
        ),
        back: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("$text"),
              SizedBox(height: 100,),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(primaryColor),
                  shape:
                  MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  _makePhoneCall("tel:776661971");
                },
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'تواصل معنا',
                    style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: primaryColor,
          title: Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () =>Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>  const Categories_Page())),
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            SizedBox(width: 100,),
              Center(child: Text('نقاط البيع ',style: TextStyle(
                fontWeight: FontWeight.bold,),)
              ),
            ],
          )),
      body: Column(
        children: <Widget>[

          Expanded(
            flex: 2,
            child: _renderContent(context," صنعاء _ السنينه _ جوار فندق الفخامه"),
          ),
          Expanded(
            flex: 2,
            child: _renderContent(context," صنعاء _ شملان _ جوار المجمع الحكومي"),
          ),

        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
    else {
      throw 'Could not launch $url';
    }
}}