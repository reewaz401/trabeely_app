import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/services/viewData.dart';

import './tour_item.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResultsWidget extends StatefulWidget {
  final String slectedType;
  ResultsWidget(this.slectedType);

  @override
  _ResultsWidgetState createState() => _ResultsWidgetState();
}

class _ResultsWidgetState extends State<ResultsWidget> {
  List dataList;

  @override
  void initState() {
    ViewData().viewData(widget.slectedType);
    var a = ViewData().viewData(widget.slectedType);
    print(a);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ViewData().viewData(widget.slectedType),
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
                      itemCount: snapshot.data['packages'].length,
                      itemBuilder: (context, index) {
                        dataList = snapshot.data['packages'];
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
                : Text('No data found');
      },
    );
  }
}
