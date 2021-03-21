import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/categoryType_widget.dart';

class CategoryListWidget extends StatefulWidget {
  var _currentselectedType;
  CategoryListWidget(this._currentselectedType);
  @override
  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          categoryButton('All'),
          categoryButton('Tours'),
          categoryButton('Treks'),
          categoryButton('Hotels'),
          categoryButton('Restaurant'),
          categoryButton('Clubs'),
        ],
      ),
    );
  }

  Widget categoryButton(String type) {
    return Container(
      decoration: widget._currentselectedType == type
          ? BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2, color: Colors.orange)),
            )
          : null,
      child: MaterialButton(
        onPressed: () {
          setState(() {
            widget._currentselectedType = type;
          });
        },
        child: Text(type),
      ),
    );
  }
}
