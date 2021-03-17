import 'package:flutter/material.dart';

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
                height: 40,
              ),
              GestureDetector(
                  onTap: () async {
                    typedDestination = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SearchWidget()));
                    setState(() {});
                  },
                  child: Container(
                    width: 0.9 * deviceSize.width,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      typedDestination == null
                          ? 'Search Destinaiton'
                          : typedDestination,
                      textAlign: TextAlign.left,
                    ),
                  )),
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
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 170,
                width: double.infinity,
                color: Colors.white,
              ),
              Container(
                height: 170,
                width: double.infinity,
                color: Colors.white,
              ),
              Container(
                height: 170,
                width: double.infinity,
                color: Colors.white,
              )
            ],
          ),
        ));
  }
}
