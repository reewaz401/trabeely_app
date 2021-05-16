import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/FilterData.dart';

import 'package:travel/services/viewData.dart';

import 'package:travel/screens/homePage/Category/Components/tour_item.dart';
import 'package:travel/screens/homePage/Category/Components/hotel_item.dart'
    as ht;

import 'dart:convert';
import 'package:http/http.dart' as http;

class ResultsWidget extends StatefulWidget {
  final String slectedType;
  final String destination;
  ResultsWidget(this.slectedType, [this.destination]);

  @override
  _ResultsWidgetState createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  List<dynamic> dataList;

  @override
  void initState() {
    ViewData().viewData(widget.slectedType);
    var a = ViewData().viewData(widget.slectedType);
    print(a);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterData>(builder: (ctx, fildata, _) {
      return FutureBuilder(
        future: ViewData().viewData(
            widget.slectedType,
            fildata.destination,
            fildata.selectedPriceRange.start.round(),
            fildata.selectedPriceRange.end.round()),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : snapshot.hasData
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, index) {
                          dataList = snapshot.data['data'];
                          return TourItem(
                            agencyName: 'Hello',
                            date: '2021-08-02 15:30',
                            destination: 'asd',
                            price: dataList[index]['price'].toDouble(),
                            title: dataList[index]['title'],
                            mainList: dataList,
                            overview: dataList[index]['overview'],
                            image: dataList[index]['packageImg'],
                            index: index,
                          );
                        },
                      ),
                    )
                  : Center(child: Text('No data found'));
        },
      );
    });
  }
}
