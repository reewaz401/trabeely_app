import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Category/category_screen.dart';

class CategoryTypeWidget extends StatelessWidget with ChangeNotifier {
  final type;
  CategoryTypeWidget([this.type]);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Wt $type');
        Navigator.pushNamed(context, CategoryScreen.routeName,
            arguments: CategoryScreen(type));
      },
      child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          width: 0.45 * MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/$type.svg',
                height: 55,
              ),
              SizedBox(
                width: 5,
              ),
              Text(type)
            ],
          )
          //  fit: BoxFit.fitWidth,

          ),
    );
  }
}
