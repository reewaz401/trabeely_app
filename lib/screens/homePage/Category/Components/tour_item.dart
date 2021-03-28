import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'DetailsScreen/tourPackDetails_screen.dart';

class TourItem extends StatelessWidget {
  final String agencyName;
  final String title;
  final String destination;
  final double price;
  final List includes;
  final String date;
  final List mainList;
  final String overview;
  final List image;
  final int index;

  TourItem(
      {this.includes,
      this.index,
      this.image,
      this.agencyName,
      this.title,
      this.destination,
      this.price,
      this.date,
      this.overview,
      this.mainList});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      // color: Colors.blueAccent,
      height: 160,

      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TourDetails(
                          mainListIndex: index,
                          mainList: mainList,
                        );
                      },
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                    height: 170.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 120.0,
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    price.toString(),
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            overview,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20.0,
                  top: 15.0,
                  bottom: 15.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      width: 110.0,
                      image: AssetImage('assets/images/anna1.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // child: InkWell(
      //   onTap: () {
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return TourDetails(
      //           mainListIndex: index,
      //           mainList: mainList,
      //         );
      //       },
      //     ));
      //   },
      //   child: Stack(
      //     alignment: Alignment.bottomCenter,
      //     children: <Widget>[
      //       // Those are our background
      //       Container(
      //         height: 136,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(22),
      //           color: index.isEven ? kBlueColor : kSecondaryColor,
      //           boxShadow: [kDefaultShadow],
      //         ),
      //         child: Container(
      //           margin: EdgeInsets.only(right: 10),
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.circular(22),
      //           ),
      //         ),
      //       ),
      //       // our product image
      //       Positioned(
      //         top: 0,
      //         right: 0,
      //         child: Hero(
      //           tag: index,
      //           child: Container(
      //               padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      //               height: 160,
      //               // image is square but we add extra 20 + 20 padding thats why width is 200
      //               width: 200,
      //               child: imageTile()),
      //         ),
      //       ),
      //       // Product title and price
      //       Positioned(
      //         bottom: 0,
      //         left: 0,
      //         child: SizedBox(
      //           height: 136,
      //           // our image take 200 width, thats why we set out total width - 200
      //           width: size.width - 200,
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Spacer(),
      //               Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                     horizontal: kDefaultPadding),
      //                 child: Text(
      //                   title,
      //                   style: Theme.of(context).textTheme.button,
      //                 ),
      //               ),
      //               // it use the available space
      //               Spacer(),
      //               Container(
      //                 padding: EdgeInsets.symmetric(
      //                   horizontal: kDefaultPadding * 1.5, // 30 padding
      //                   vertical: kDefaultPadding / 4, // 5 top and bottom
      //                 ),
      //                 decoration: BoxDecoration(
      //                   color: kSecondaryColor,
      //                   borderRadius: BorderRadius.only(
      //                     bottomLeft: Radius.circular(22),
      //                     topRight: Radius.circular(22),
      //                   ),
      //                 ),
      //                 child: Text(
      //                   price.toString(),
      //                   style: Theme.of(context).textTheme.button,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget imageTile() {
    return image[0] != null
        ? Image.network('https://api.trabeely.com/uploads/package/${image[0]}')
        : SvgPicture.asset(
            'assets/images/logo.svg',
            alignment: Alignment.center,
          );
  }

  Widget detailsTile(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'overview',
              maxLines: 4,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Date : ',
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                    TextSpan(
                        text: DateFormat.yMMMd('en_US')
                            .format(DateTime.parse(date))
                            .toString(),
                        style: TextStyle(color: Colors.pink[900]))
                  ]),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Npr : ',
                        style: TextStyle(color: Colors.grey, fontSize: 10)),
                    TextSpan(
                        text: price.toString(),
                        style: TextStyle(color: Colors.green[900]))
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Seller : $agencyName'),
                IconButton(
                  icon: Icon(Icons.arrow_forward_rounded),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TourDetails())),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
