import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/Category/Components/DetailsScreen/tourPackDetails_screen.dart';

class DestinationCarousel extends StatelessWidget {
  final cityName;
  final country;
  final activites;
  final des;
  final image;
  DestinationCarousel(
      {this.cityName, this.activites, this.country, this.des, this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 200.0,
            width: 0.5 * MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: 150.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                          height: 120.0,
                          width: 180.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  activites,
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  des,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: Hero(
                            tag: Image.asset('assets/images/$image.jpeg'),
                            child: InkWell(
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) {
                              //         return TourDetails(
                              //           mainListIndex: 3,
                              //           mainList: [],
                              //         );
                              //       },
                              //     ),
                              //   );
                              // },
                              child: Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      height: 145.0,
                                      width: 180.0,
                                      image: AssetImage(
                                          'assets/images/$image.jpeg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    left: 10.0,
                                    bottom: 10.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          cityName,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.arrow_back,
                                              size: 10.0,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 5.0),
                                            Text(
                                              country,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                          bottom: 3,
                          right: 3,
                          child: Image.asset(
                            'assets/images/downArrow.png',
                            height: 25,
                          ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green[100],
                  ),
                  width: 0.5 * MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Price :  ',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 18),
                          ),
                          Text('Rs 1200', style: TextStyle(fontSize: 18))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'We have the variety of the mountains within and the we go',
                        maxLines: null,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
