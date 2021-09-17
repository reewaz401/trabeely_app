import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travel/components/uploadPhoto.dart';
import 'package:travel/controller/getUserName.dart';
import 'package:travel/screens/Settings/UserUpdate/userProfileEdit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/UserProile/Components/askSignup.dart';
import 'package:travel/screens/UserProile/storyDisplay.dart';
import 'package:travel/screens/UserProile/upperWidget.dart';
import 'package:travel/services/deviceSize.dart';
import 'package:travel/services/isLogin.dart';
import 'package:travel/services/Api/postapi.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  UserProfileScreenState createState() => UserProfileScreenState();
}

class UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Map postedStory;
  File _image;
  var _istoken;
  String userName;
  final picker = ImagePicker();

  storysetingUp() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String _token = preferences.getString('userToken');
    String _cookie = preferences.getString('cookie');
    String _server = preferences.getString('server');
    var data = await http.post(
      'https://api.trabeely.com/api/story/get-my-story',
      headers: {
        'Authorization': 'Bearer $_token',
        'Cookie': _cookie,
        'Server': _server
      },
      body: {"userId": "60606ba830da000c9436cb13"},
    );

    var response = json.decode(data.body);
    setState(() {
      postedStory = response;
    });
  }

  // Future getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     } else {
  //       print('No image selected.');
  //     }
  //   });
  // }

////

  loadinit() async {
    storysetingUp();
    _tabController = new TabController(length: 2, vsync: this);
    Islogin().getToken().then((value) {
      setState(() {
        _istoken = value;
      });
    });
    userName = await getUsername();
  }

////
  @override
  void initState() {
    loadinit();
    super.initState();
  }

  ///
  @override
  void dispose() {
    super.dispose();
  }

  ///
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    print(_istoken);
    return FutureBuilder(
        future: getUsername(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : snapshot.hasData
                  ? Scaffold(
                      body: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UpperWidget(
                                // image: _image.path,
                                ),
                            Text(
                              userName,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
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
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  myStoryView(postedStory),
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
                    )
                  : Center(child: AskSignUpScreen());
        });
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
