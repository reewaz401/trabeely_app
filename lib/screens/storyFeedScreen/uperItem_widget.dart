import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/components/SizeConfig.dart';
//mport 'package:travel/components/svgPicture.dart';

class UpperItemWidget extends StatelessWidget {
  //const UpperItemWidget({ Key? key }) : super(key: key);
  final String userName;
  UpperItemWidget({this.userName});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 0.08 * SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Material(
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: SizedBox(
                width: 0.8 * SizeConfig.screenWidth,
                child: Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      userName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              trailing: PopupMenuButton(
                  child: SvgPicture.asset(
                    'assets/images/Group-2.svg',
                    height: 0.035 * SizeConfig.screenHeight,
                  ),
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'Detail',
                          child: Text('View Detail'),
                        ),
                        PopupMenuItem(
                          value: 'Save',
                          child: Text('Save Image'),
                        ),
                      ]),
            ),
          ),
        ));
  }
}
