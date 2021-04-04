import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/components/categoryType_widget.dart';
import 'package:travel/screens/homePage/components/search_widget.dart';
import 'package:travel/services/viewData.dart';

class ViewDestination extends StatefulWidget {
  final destination;
  ViewDestination(this.destination);
  @override
  _ViewDestinationState createState() => _ViewDestinationState();
}

class _ViewDestinationState extends State<ViewDestination> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScroll) {
        return [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            // Add this code
            bottom: PreferredSize(
              // Add this code
              preferredSize: Size.fromHeight(20.0),
              child: Text(''),
            ),
            expandedHeight: 350.0,
            collapsedHeight: 175.0,
            floating: false,
            pinned: true,
            flexibleSpace: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/anna2.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                FlexibleSpaceBarSettings(
                  currentExtent: 0.0,
                  minExtent: 0,
                  maxExtent: 230,
                  toolbarOpacity: 1,
                  child: FlexibleSpaceBar(
                    titlePadding:
                        EdgeInsetsDirectional.only(start: 30, bottom: 15),
                    title: Text(''),
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            widget.destination,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        SearchWidget(widget.destination))),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.navigation_outlined,
                            size: 15.0,
                            color: Colors.white70,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            'Nepal',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white70,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              CategoryTypeWidget('All', widget.destination),
              CategoryTypeWidget('Tours', widget.destination),
            ],
          ),
          Row(
            children: [
              CategoryTypeWidget('Treks', widget.destination),
              CategoryTypeWidget('Hotels', widget.destination),
            ],
          ),
          Row(
            children: [
              CategoryTypeWidget('Restaurants', widget.destination),
              CategoryTypeWidget('Clubs', widget.destination),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          listData('Tours'),
          listData(
            'Treks',
          ),
          listData("Hotels")

          //listData('Hotels'),
        ]),
      ),
    ));
  }

  Widget listData(
    String type,
  ) {
    return Container(
      height: 220,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  '$type in ${widget.destination}',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
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
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                card(
                    type == "Hotels" ? "Holiday Inn" : 'A drive in Mustang',
                    type == "Hotels" ? '1300' : '25000',
                    type == "Hotels" ? 'mhotel1' : 'mustang1'),
                SizedBox(
                  width: 15,
                ),
                card(
                    type == "Hotels" ? 'Royal' : 'Mustang',
                    type == "Hotels" ? '2000' : '25000',
                    type == "Hotels" ? 'mhotel2' : 'musatng2'),
                SizedBox(
                  width: 15,
                ),
                card(
                    type == "Hotels" ? 'Monalisa' : 'Live Mustang',
                    type == "Hotels" ? '1000' : '25000',
                    type == "Hotels" ? 'mhotel3' : 'mustang3'),
                SizedBox(
                  width: 15,
                ),
                card(
                    type == "Hotels" ? 'Oms Homs' : 'Uproad Mustang',
                    type == "Hotels" ? '1500' : '25000',
                    type == "Hotels" ? 'mhotel4' : 'musatng2'),
              ],
            ),
          ),

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

  Widget card(String title, String price, String image) {
    return Container(
      width: 150,
      height: 170,
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
                    Text(price,
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
