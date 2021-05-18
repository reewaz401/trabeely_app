import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:travel/components/SizeConfig.dart';
import 'package:travel/screens/CreateTour/createTour.dart';
import 'package:travel/screens/homePage/components/card.dart';
import 'package:travel/screens/homePage/components/homepagecard.dart';
import 'package:travel/screens/homePage/components/hotelCard.dart';
import 'package:travel/screens/homePage/components/toursCard.dart';
import 'package:travel/services/deviceSize.dart';

import './components/categoryType_widget.dart';

import 'package:travel/screens/homePage/components/search_widget.dart';

//import '../search_screen.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = '/homepage';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    //destinattion
    String typedDestination;
    SearchWidget args;
    var deviceSize = MediaQuery.of(context).size;
    var paddingSize = MediaQuery.of(context).padding.top;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => CreateTour()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        padding: EdgeInsets.all(kcontentpadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: (SizeConfig.khspace * 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryTypeWidget('Tours'),
                  CategoryTypeWidget('Treks'),
                  CategoryTypeWidget('Weekends'),
                  CategoryTypeWidget('Adventures')
                ],
              ),
              SizedBox(
                height: (3 * SizeConfig.khspace),
              ),
              Text(
                'Discover',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              SizedBox(
                height: (2 * SizeConfig.khspace),
              ),
              SizedBox(
                  height: SizeConfig.khAdvertise,
                  width: SizeConfig.kwAdvertise,
                  child: Carousel(
                    showIndicator: false,
                    autoplayDuration: Duration(seconds: 10),
                    images: [
                      ExactAssetImage("assets/images/anna1.jpeg"),
                      ExactAssetImage("assets/images/anna2.jpeg"),
                      ExactAssetImage("assets/images/anna.jpg")
                    ],
                    dotSize: 4.0,
                    dotSpacing: 15.0,
                    dotColor: Colors.lightGreenAccent,
                    indicatorBgPadding: 5.0,
                    dotBgColor: Colors.purple.withOpacity(0.5),
                    borderRadius: true,
                  )),
              SizedBox(
                height: (2 * SizeConfig.khspace),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Best Deals',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print('See All'),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
              HomepageCard()
            ],
          ),
        ),
      ),
    );
  }
}
