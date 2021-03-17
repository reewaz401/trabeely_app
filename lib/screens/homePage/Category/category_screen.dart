import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Components/categoryList_widget.dart';
import './Components/filter_widget.dart';
import './Components/results_widget.dart';

class CategoryScreen extends StatefulWidget {
  final currentslectedType;
  CategoryScreen([this.currentslectedType]);
  static const routeName = '/category-screen';

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            children: [
              Text('${widget.currentslectedType}'),
              Text('asd'),
              CategoryListWidget(widget.currentslectedType),
              Filter().tourFilter(context),
              ResultsWidget('pe'),
            ],
          ),
        ),
      ),
    );
  }
}
