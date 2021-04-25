import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:travel/screens/UserProile/Components/askSignup.dart';
import '../../services/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatefulWidget {
  final String userName;
  UserProfileScreen(this.userName);

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String userName;
  Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final String userName = preferences.getString('username');
    return userName;
  }

  @override
  void initState() {
    getUserName().then((value) {
      setState(() {
        userName = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: userName == null
          ? Center(
              child: AskSignUpScreen(),
            )
          : Column(
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
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 15,
                      child: Container(
                        height: 0.25 * MediaQuery.of(context).size.height,
                        //  color: Colors.red,
                        width: 0.70 * MediaQuery.of(context).size.width,
                        child: PageView(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              height: 0.25 * MediaQuery.of(context).size.height,
                              width: 0.70 * MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.black54),
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
                              padding:
                                  EdgeInsets.only(top: 8, left: 60, right: 15),
                              height: 0.25 * MediaQuery.of(context).size.height,
                              width: 0.70 * MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.black54),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Rewards : ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      Text(
                                        "30 points",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Distance : ",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      Text(
                                        "356 km",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
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
                    Positioned(
                      left: 0,
                      top: 40,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/profile.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 8),
                            borderRadius: BorderRadius.circular(20)),
                        height: 145,
                        width: 145,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        userName == null ? '' : userName,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'A mantra goes here',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                QrImage(
                  data: "1234567890",
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ],
            ),
    );
  }
}
