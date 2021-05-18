import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel/components/SizeConfig.dart';
import 'package:travel/screens/CreateTour/createTourCard.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/FilterData.dart';
import 'package:travel/screens/homePage/components/categoryType_widget.dart';
import 'package:travel/screens/homePage/components/search_widget.dart';
import 'package:travel/services/viewData.dart';
import 'package:provider/provider.dart';

class ViewDestination extends StatefulWidget {
  final destination;
  ViewDestination(this.destination);
  @override
  _ViewDestinationState createState() => _ViewDestinationState();
}

class _ViewDestinationState extends State<ViewDestination> {
  List<dynamic> dataList;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<FilterData>(context, listen: false);
    provider.setDestination(widget.destination);

    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScroll) {
        return [
          SliverAppBar(
              backgroundColor: Colors.blue[900],
              elevation: 0.0,

              // bottom: PreferredSize(
              //   // Add this code
              //   preferredSize: Size.fromHeight(20.0),
              //   child: Text(''),
              // ),
              expandedHeight: SizeConfig.khextendedAppBar,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/images/anna2.jpeg',
                  fit: BoxFit.cover,
                ),
                title: Text(widget.destination),
              )

              // FlexibleSpaceBarSettings(
              //   currentExtent: 0.0,
              //   minExtent: 0,
              //   maxExtent: 230,
              //   toolbarOpacity: 1,
              //   child: FlexibleSpaceBar(
              //     titlePadding:
              //         EdgeInsetsDirectional.only(start: 30, bottom: 15),
              //     title: Text(''),
              //   ),
              // ),

              ),
        ];
      },
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(SizeConfig.kSafeAreaHorizental),
          child: Column(children: [
            SizedBox(
              height: SizeConfig.khspace + 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CategoryTypeWidget('Tours', widget.destination),
                CategoryTypeWidget('Treks', widget.destination),
                CategoryTypeWidget('Restaurants', widget.destination),
                CategoryTypeWidget('Clubs', widget.destination)
              ],
            ),
            SizedBox(
              height: SizeConfig.khspace + 5,
            ),
            listData('Tours', provider),
            listData('Treks', provider),

            //listData('Hotels'),
          ]),
        ),
      ),
    ));
  }

  Widget listData(String type, FilterData provider) {
    return Container(
      height: 210,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$type in ${widget.destination}',
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
          SizedBox(
            height: SizeConfig.khspace + 5,
          ),
          FutureBuilder(
              future: ViewData().viewData(type, provider.destination, 0, 0),
              builder: (context, snapshot) {
                print('sdsddsfsdfddsffsdfsdds');

                return snapshot.connectionState == ConnectionState.waiting
                    ? Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : snapshot.hasData
                        ? snapshot.data['data'].length > 0
                            ? Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data['data'].length,
                                  itemBuilder: (context, index) {
                                    dataList = snapshot.data['data'];
                                    print(dataList[index]['price']);
                                    return card(dataList[index]['title'],
                                        dataList[index]['price'], 'mustang1');
                                  },
                                ),
                              )
                            : CreateTourCard()
                        : CreateTourCard();
              }),

          /* FutureBuilder(
              future: ViewData().viewData(type, widget.destination, true),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : snapshot.hasData
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  var data = snapshot.data[index];
                                  return Container(
                                    width: 150,
                                    height: 100,
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: [
                                        Text(data["title"]),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  );
                                }),
                          )
                        : Center(
                            child: Text("No data"),
                          );
              }),*/
        ],
      ),
    );
  }

  Widget card(String title, int price, String image) {
    return Container(
      //margin: EdgeInsets.only(left: ),
      child: Column(
        children: [
          Container(
            height: 120,
            child: Image.asset(
              'assets/images/$image.jpeg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Text('Starting from',
                        style: TextStyle(
                          fontSize: 10,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(price.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.green))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
