import 'package:flutter/material.dart';
import 'package:travel/screens/homePage/components/categoryType_widget.dart';
import './Components/categoryList_widget.dart';
import './Components/filter_widget.dart';
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          child: Column(
            children: [
              CategoryListWidget(args.type),
              Filter().tourFilter(context),
              ResultsWidget('pe'),
            ],
          ),
        ),
      ),
    );
  }
}
