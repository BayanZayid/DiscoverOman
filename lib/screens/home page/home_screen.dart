import 'package:disoveroman2/screens/uber_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../hotel_categories_screen.dart';
import '../trip_categories_screen.dart';
import '../user_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Container(
              height: size.height * .45,
              decoration:  BoxDecoration(
                  color: Colors.greenAccent[100]!,
                  image: const DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage("assets/images/undraw_pilates_gpdb.png"))
              ),
            ),
            //SizedBox(height: 20,),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        // logo border
                        alignment: Alignment.center,
                        //margin: const EdgeInsets.symmetric(vertical: 20),
                        width: 60,
                        height: 60,
                        //margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
                      ),

                    ),
                    Container(
                      //margin: EdgeInsets.only(top: 0), // Adjust the value as per your requirement
                      child: Text(
                        "Welcome To \nDiscover Oman App",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          //fontWeight: FontWeight.w200,
                          fontSize: 35,
                          color: Colors.black,//Color(0xFF33691E),
                          fontFamily: 'AprilFatface',
                        ),
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [BoxShadow( blurRadius:2,blurStyle: BlurStyle.normal)],
                        borderRadius: BorderRadius.circular(29.5),

                      ),
                      child: const TextField(
                        style: TextStyle(fontFamily: 'Ysabeau',fontSize: 20),
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search,color: Colors.black38,),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            title: "Book Hotels",
                            images: "assets/images/2.png",
                            press: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => HotelCatogariesScreen()),
                              );
                            },
                          ),
                          CategoryCard(
                            title: "Book Trip",
                            images: "assets/images/trip.png",
                            press: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => TripCatogariesScreen()),
                              );
                            },
                          ),
                          CategoryCard(
                            title: "Book Taxi",
                            images: "assets/images/5.png",
                            press: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => UberScreen()),
                              );
                            },
                          ),
                          CategoryCard(
                            title: "Profile",
                            images: "assets/images/3.png",
                            press: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UserProfile()),
                              );
                            },
                          ),


                        ],
                      ),
                    )

                  ],
                ),
              ),


            )
          ]
      ),

    );
  }
}

class CategoryCard extends StatelessWidget{
  final String images;
  final String title;
  final VoidCallback press;
  const CategoryCard({
    required this.images, required this.title, required this.press,
  }) ;


  @override
  Widget build(BuildContext context){
    return ClipRRect(
      //borderRadius: BorderRadius.circular(13),
      child: Container(
        //padding:EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            )
            ,
            //boxShadow: [BoxShadow( blurRadius:2,blurStyle: BlurStyle.normal)]
            boxShadow: const [BoxShadow(
              offset: Offset(13,17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.black,
            )]
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(images),
                  Spacer(),
                  Text(title,
                    textAlign: TextAlign.center,

                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 20,fontFamily:'Ysabeau' ),)

                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}