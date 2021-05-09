import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/screens/homePage/Category/Components/FilterWidget/allFilter.dart';
import 'package:travel/screens/homePage/Category/Components/FilterWidget/hotelFilter_widget.dart';
import 'package:travel/screens/homePage/Category/Components/FilterWidget/tourFilter_widget.dart';
import 'package:travel/screens/homePage/components/categoryType_widget.dart';
import 'package:travel/services/getTabIndex.dart';
import './Components/results_widget.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = '/category-scren';
  String type;
  final String destination;
  CategoryScreen(this.type, [this.destination]);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool inital = false;
  var path = 'Treks';
  int index;
  bool indexFinder = true;

  @override
  void didChangeDependencies() {
    if (indexFinder) {
      index = getIndex(widget.type);
      print('Type' + widget.type);
      indexFinder = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 4,
      child: Scaffold(
        backgroundColor: Color(0xFFF3F2F2),
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          bottom: TabBar(
            indicatorColor: Colors.green,
            indicator: BubbleTabIndicator(
                indicatorHeight: 40,
                indicatorRadius: 150,
                indicatorColor: Colors.green),
            tabs: [
              Tab(
                child: SvgPicture.asset('assets/images/Tours.svg'),
              ),
              Tab(
                child: SvgPicture.asset('assets/images/Treks.svg'),
              ),
              Tab(
                child: SvgPicture.asset('assets/images/Weekends.svg'),
              ),
              Tab(
                child: SvgPicture.asset('assets/images/Adventures.svg'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                TourFilter(),
                ResultsWidget('Tours', widget.destination),
              ],
            ),
            Column(
              children: [
                TourFilter(),
                ResultsWidget('Treks', widget.destination),
              ],
            ),
            ResultsWidget('Restaurents', widget.destination),
            ResultsWidget('Clubs', widget.destination),
          ],
        ),
      ),
    );
  }

  Widget categoryButton(String type, String currentselectedType) {
    return Container(
        child: MaterialButton(
      onPressed: () {
        setState(() {
          currentselectedType = type;
        });
      },
      child: currentselectedType == type
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
