import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/components/card.dart';
import 'package:travel/screens/homePage/components/homepagecard.dart';
import 'package:travel/screens/homePage/components/hotelCard.dart';
import 'package:travel/screens/homePage/components/toursCard.dart';

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
    return Container(
        height: deviceSize.height,
        width: deviceSize.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryTypeWidget('All'),
                  CategoryTypeWidget('Tours'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryTypeWidget('Treks'),
                  CategoryTypeWidget('Hotels'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CategoryTypeWidget('Restaurants'),
                  CategoryTypeWidget('Clubs'),
                ],
              ),
              SizedBox(
                height: 30,
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
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
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
              ),
              HomepageCard(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tours Deals',
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
              ),
              toursCard(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Hotels Deals',
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
              ),
              hotelCard(),
            ],
          ),
        ));
  }
}
