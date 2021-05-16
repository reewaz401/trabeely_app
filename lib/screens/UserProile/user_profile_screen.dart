import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travel/components/uploadPhoto.dart';
import 'package:travel/screens/Settings/UserUpdate/userProfileEdit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/UserProile/Components/askSignup.dart';
import 'package:travel/services/deviceSize.dart';
import 'package:travel/services/isLogin.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  UserProfileScreenState createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  var _istoken;
  String userName;
  void getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userId');
  }

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    Islogin().getToken().then((value) {
      setState(() {
        _istoken = value;
      });
    });
    getUsername();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: _istoken == null
          ? Center(child: AskSignUpScreen())
          : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
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
                              children: [
                                Container(
                                  margin: EdgeInsets.all(15),
                                  padding: EdgeInsets.all(10),
                                  height:
                                      0.25 * MediaQuery.of(context).size.height,
                                  width:
                                      0.70 * MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Up coming trips",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.only(
                                      top: 0.01005364 * deviceSize.height,
                                      left: 0.15277781 * deviceSize.width,
                                      right: 0.03819445 * deviceSize.width),
                                  height:
                                      0.25 * MediaQuery.of(context).size.height,
                                  width:
                                      0.70 * MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rewards : ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            "30 points",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            (2 * tspacing) * deviceSize.height,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Distance : ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            "356 km",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
                                child: _image == null
                                    ? Image.asset(
                                        'assets/images/profile.jpeg',
                                        fit: BoxFit.cover,
                                      )
                                    : Image.file(
                                        _image,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 8),
                                  borderRadius: BorderRadius.circular(20)),
                              height: 0.19097222 * deviceSize.height,
                              width: 0.36921303 * deviceSize.width,
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
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              content: Container(
                                                height: 150,
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        getImage();
                                                      },
                                                      title: Text(
                                                          'Upload An Image'),
                                                    ),
                                                    ListTile(
                                                      title: Text(
                                                          'Edit Your Info'),
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                        return Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) {
                                                          return ProfileData();
                                                        }));
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                    }),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(
                    userName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: tspacing * deviceSize.height,
                  ),
                  Text('A mantra goes here'),
                  SizedBox(
                    height: 0.01975575 * deviceSize.height,
                  ),
                  TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Colors.red,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.photo),
                      ),
                      Tab(
                        icon: Icon(Icons.qr_code),
                      )
                    ],
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Text('people'),
                        Center(
                          child: QrImage(
                            data: "6076a25b5ada354cae965f7b",
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        )
                      ],
                      controller: _tabController,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

// var _istoken;
// String userName;
// void getUsername() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   userName = prefs.getString('username');
// }

// @override
// void initState() {
// Islogin().getToken().then((value) {
//   setState(() {
//     _istoken = value;
//   });
// });
// getUsername();

//   super.initState();
// }
