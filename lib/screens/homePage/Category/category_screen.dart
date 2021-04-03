import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:travel/screens/homePage/Category/Components/FilterWidget/allFilter.dart';

import 'package:travel/screens/homePage/Category/Components/FilterWidget/hotelFilter_widget.dart';
import 'package:travel/screens/homePage/Category/Components/FilterWidget/tourFilter_widget.dart';
import 'package:travel/screens/homePage/components/categoryType_widget.dart';

import './Components/results_widget.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category-scren';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final CategoryTypeWidget args = ModalRoute.of(context).settings.arguments;
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //CategoryListWidget(args.type),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryButton('All', args.type),
                    categoryButton('Tours', args.type),
                    categoryButton('Treks', args.type),
                    categoryButton('Hotels', args.type),
                    categoryButton('Restaurant', args.type),
                    categoryButton('Clubs', args.type),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              filtering(args.type),
              SizedBox(
                height: 10,
              ),
              ResultsWidget(args.type, args.destination),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryButton(String type, String _currentselectedType) {
    return Container(
        child: MaterialButton(
      onPressed: () {
        setState(() {
          _currentselectedType = type;
        });
      },
      child: _currentselectedType == type
          ? SvgPicture.asset(
              'assets/images/$type.svg',
              height: 35,
            )
          : Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                'assets/images/$type.svg',
                height: 35,
              ),
            ),
    ));
  }

  Widget filtering(String type) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 8, right: 8, bottom: 8),
      width: 0.95 * MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          // border: Border.all(width: 0.5),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          type == "Hotels"
              ? HotelFilter()
              : type == "All"
                  ? AllFilter()
                  : TourFilter(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              button('Search'),
            ],
          )
        ],
      ),
    );
  }

  Widget button(String name) {
    return Container(
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.orange,
        onPressed: () {},
      ),
    );
  }
}
