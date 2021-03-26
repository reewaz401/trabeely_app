import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/components/card.dart';

import './components/categoryType_widget.dart';

import 'package:travel/screens/homePage/components/search_widget.dart';

//import '../search_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //destinattion
    String typedDestination;

    var deviceSize = MediaQuery.of(context).size;
    var paddingSize = MediaQuery.of(context).padding.top;
    return Container(
        height: deviceSize.height,
        width: deviceSize.width,
        color: Colors.white,
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
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Best Deals',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.normal,
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
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DestinationCarousel(
                        activites: 'Trek',
                        cityName: 'Annapurna',
                        country: 'Nepal',
                        image: 'anna1',
                        des: 'We an go all out',
                      ),
                      DestinationCarousel(
                        activites: 'Trek',
                        cityName: 'Everest',
                        country: 'Nepal',
                        image: 'anna2',
                        des: 'We an go all out',
                      ),
                      DestinationCarousel(
                        activites: 'Trek',
                        cityName: 'Mardi',
                        country: 'Nepal',
                        image: 'anna3',
                        des: 'We an go all out',
                      ),
                      DestinationCarousel(
                        activites: 'Trek',
                        cityName: 'Mardi',
                        country: 'Nepal',
                        image: 'anna1',
                        des: 'We an go all out',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
