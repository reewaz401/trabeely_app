import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Category/category_screen.dart';

class CategoryTypeWidget extends StatefulWidget with ChangeNotifier {
  final String type;
  CategoryTypeWidget([this.type]);

  @override
  _CategoryTypeWidgetState createState() => _CategoryTypeWidgetState();
}

class _CategoryTypeWidgetState extends State<CategoryTypeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CategoryScreen.routeName,
            arguments: CategoryTypeWidget(widget.type));
      },
      child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          width: 0.45 * MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(width: 1),
              color: Color(widget.type == "All" || widget.type == "Hotels"
                  ? 0xFFFCF0FC
                  : widget.type == "Tours" || widget.type == "Restaurants"
                      ? 0xFFFDF2E3
                      : 0xFFC7DEDC)),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/${widget.type}.svg',
                height: 55,
              ),
              SizedBox(
                width: 5,
              ),
              Text(widget.type)
            ],
          )
          //  fit: BoxFit.fitWidth,

          ),
    );
  }
}
