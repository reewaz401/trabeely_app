import 'package:flutter/material.dart';
import 'package:travel/components/SizeConfig.dart';
import 'package:travel/components/customAlertBox.dart';
import 'package:travel/screens/Settings/UserUpdate/userProfileEdit.dart';
import 'package:travel/services/deviceSize.dart';

class UpperWidget extends StatefulWidget {
  //const UpperWidget({ Key? key }) : super(key: key);
  // final String image;
  // UpperWidget({this.image});
  @override
  _UpperWidgetState createState() => _UpperWidgetState();
}

class _UpperWidgetState extends State<UpperWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 0.35 * MediaQuery.of(context).size.height,
          //  decoration: BoxDecoration(color: Colors.white),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 0.30 * MediaQuery.of(context).size.height,
            width: 0.75 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.blue[900]),
            child: Container(
              height: 0.25 * MediaQuery.of(context).size.height,
              //  color: Colors.red,
              width: 0.70 * MediaQuery.of(context).size.width,
              child: PageView(
                children: [firstpage(), secondPage()],
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 40,
          child: Stack(
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                // child: widget.image == null
                //     ? Image.asset(
                //         'assets/images/profile.jpeg',
                //         fit: BoxFit.cover,
                //       )
                //     : Container()),
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 8),
                    borderRadius: BorderRadius.circular(20)),
                height: 0.19097222 * SizeConfig.screenHeight,
                width: 0.36921303 * SizeConfig.screenWidth,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        CustomAlertBox().popUpBox(
                          context: context,
                          content: 'Edit',
                          item: Container(
                            height: 150,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    // getImage();
                                  },
                                  title: Text('Upload An Image'),
                                ),
                                ListTile(
                                  title: Text('Edit Your Info'),
                                  onTap: () {
                                    Navigator.pop(context);
                                    return Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ProfileData();
                                    }));
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                        // showDialog(
                        //     context: context,
                        //     builder: (context) {
                        //       return AlertDialog(
                        //         content: Container(
                        //           height: 150,
                        //           child: Column(
                        //             children: [
                        //               ListTile(
                        //                 onTap: () {
                        //                   Navigator.pop(context);
                        //                   // getImage();
                        //                 },
                        //                 title: Text('Upload An Image'),
                        //               ),
                        //               ListTile(
                        //                 title: Text('Edit Your Info'),
                        //                 onTap: () {
                        //                   Navigator.pop(context);
                        //                   return Navigator.push(context,
                        //                       MaterialPageRoute(
                        //                           builder: (context) {
                        //                     return ProfileData();
                        //                   }));
                        //                 },
                        //               )
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     });
                      }),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget firstpage() {
    return seeBox(Column(
      children: [
        Text(
          "Up coming trips",
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    ));
  }

  Widget secondPage() {
    return seeBox(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rewards : ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "30 points",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: (2 * tspacing) * SizeConfig.screenHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Distance : ",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              Text(
                "356 km",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget seeBox(Widget item) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        height: 0.25 * MediaQuery.of(context).size.height,
        width: 0.70 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(15)),
        child: item);
  }
}
