import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'package:shelhops/Homes_Pages/Categories_Pages/View_page2.dart';
import '../const/constance.dart';
final List<String> images = [
  'https://media.istockphoto.com/photos/young-woman-snorkeling-with-coral-reef-fishes-picture-id939931682?s=612x612',
  'https://media.istockphoto.com/photos/woman-relaxing-in-sleeping-bag-on-red-mat-camping-travel-vacations-in-picture-id1210134412?s=612x612',
  'https://media.istockphoto.com/photos/green-leaf-with-dew-on-dark-nature-background-picture-id1050634172?s=612x612',
  'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?s=612x612',
  // 'https://www.istockphoto.com/en/photo/woman-standing-and-looking-at-lago-di-carezza-in-dolomites-gm1038870630-278083784',
  'https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?s=612x612',
  'https://media.istockphoto.com/photos/connection-with-nature-picture-id1174472274?s=612x612',
  'https://media.istockphoto.com/photos/in-the-hands-of-trees-growing-seedlings-bokeh-green-background-female-picture-id1181366400',
  'https://media.istockphoto.com/photos/winding-road-picture-id1173544006?s=612x612',
  'https://media.istockphoto.com/photos/sunset-with-pebbles-on-beach-in-nice-france-picture-id1157205177?s=612x612',
  'https://media.istockphoto.com/photos/waves-of-water-of-the-river-and-the-sea-meet-each-other-during-high-picture-id1166684037?s=612x612',
  'https://media.istockphoto.com/photos/happy-family-mother-father-children-son-and-daughter-on-sunset-picture-id1159094800?s=612x612',
  'https://media.istockphoto.com/photos/butterflies-picture-id1201252148?s=612x612',
  'https://media.istockphoto.com/photos/beautiful-young-woman-blows-dandelion-in-a-wheat-field-in-the-summer-picture-id1203963917?s=612x612',
  'https://media.istockphoto.com/photos/summer-meadow-picture-id1125637203?s=612x612',
];
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return (
       Scaffold(
        body: SafeArea(
            child:Stack(
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
                ),


                Container(
                  padding:EdgeInsets.only(top: 250,left: 10,),
                  child: GridView(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 70,crossAxisSpacing: 15
                  ),

                    children: [
                      InkWell(
                      onTap: (){
                Navigator.push(
                context,
                new  MaterialPageRoute(builder: (context)=> new View_page2()));
                },
                        child: Container(

                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          padding: EdgeInsets.only(right: 10,),
                          child: Column(

                            children: [

                              Container(color: Colors.white,
                                height: 140,width: 200,
                                child:
                                Image.asset("assets/4.png",height: 150,fit: BoxFit.cover,),

                              ),SizedBox(height: 7,),

                              Container(

                                height: 43 ,width:  double.infinity,
                                decoration: BoxDecoration(border: Border.all(width: 2.0,color:primaryColor),
                                  borderRadius: BorderRadius.all(Radius.circular(20),),color: Colors.white
                                  ,
                                ),

                                child: Center(
                                  child: Text("نحت وخط",style:  TextStyle(
                                    color: primaryColor,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.bold,)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        padding: EdgeInsets.only(right: 10,),
                        child: Column(

                          children: [

                            Container(color: Colors.white,
                              height: 140,width: 200,
                              child:
                              Image.asset("assets/4.png",height: 150,fit: BoxFit.cover,),

                            ),SizedBox(height: 7,),

                            Container(

                              height: 43 ,width:  double.infinity,
                              decoration: BoxDecoration(border: Border.all(width: 2.0,color:primaryColor),
                                borderRadius: BorderRadius.all(Radius.circular(20),),color: Colors.white
                                ,
                              ),

                              child: Center(
                                child: Text("تحف وهدايا واكسوارات",style:  TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        padding: EdgeInsets.only(right: 10,),
                        child: Column(

                          children: [

                            Container(color: Colors.white,
                              height: 140,width: 200,
                              child:
                              Image.asset("assets/4.png",height: 150,fit: BoxFit.cover,),

                            ),SizedBox(height: 7,),

                            Container(

                              height: 43 ,width:  double.infinity,
                              decoration: BoxDecoration(border: Border.all(width: 2.0,color:primaryColor),
                                borderRadius: BorderRadius.all(Radius.circular(20),),color: Colors.white
                                ,
                              ),

                              child: Center(
                                child: Text("العروض",style:  TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        padding: EdgeInsets.only(right: 10,),
                        child: Column(

                          children: [

                            Container(color: Colors.white,
                              height: 140,width: 200,
                              child:
                              Image.asset("assets/4.png",height: 150,fit: BoxFit.cover,),

                            ),SizedBox(height: 7,),

                            Container(

                              height: 43 ,width:  double.infinity,
                              decoration: BoxDecoration(border: Border.all(width: 2.0,color:primaryColor),
                                borderRadius: BorderRadius.all(Radius.circular(20),),color: Colors.white
                                ,
                              ),

                              child: Center(
                                child: Text("باقات ميك اب",style:  TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        padding: EdgeInsets.only(right: 10,),
                        child: Column(

                          children: [

                            Container(color: Colors.white,
                              height: 140,width: 200,
                              child:
                              Image.asset("assets/4.png",height: 150,fit: BoxFit.cover,),

                            ),SizedBox(height: 7,),

                            Container(

                              height: 43 ,width:  double.infinity,
                              decoration: BoxDecoration(border: Border.all(width: 2.0,color:primaryColor),
                                borderRadius: BorderRadius.all(Radius.circular(20),),color: Colors.white
                                ,
                              ),

                              child: Center(
                                child: Text("باقات شكولاته",style:  TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        padding: EdgeInsets.only(right: 10,),
                        child: Column(

                          children: [

                            Container(color: Colors.white,
                              height: 140,width: 200,
                              child:
                              Image.asset("assets/4.png",height: 150,fit: BoxFit.cover,),

                            ),SizedBox(height: 7,),

                            Container(

                              height: 43 ,width:  double.infinity,
                              decoration: BoxDecoration(border: Border.all(width: 2.0,color:primaryColor),
                                borderRadius: BorderRadius.all(Radius.circular(20),),color: Colors.white
                                ,
                              ),

                              child: Center(
                                child: Text("باقات ومسكات ورد",style:  TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold,)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )



        ),

      )
    );
  }
}
