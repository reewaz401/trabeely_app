import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel/services/Api/postapi.dart';

import 'package:travel/widget/textField.dart';

class UpdatePassword extends StatefulWidget {
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool _isoldVisibility = false;
  bool _isnewVisibility = false;
  @override
  Widget build(BuildContext context) {
    TextEditingController oldPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    return SafeArea(
      child: Center(
          child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue[900]),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    //tra style: TextStyle(color: Colors.white),
                    controller: oldPassword,
                    obscureText: _isoldVisibility ? false : true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Container(
                        width: 90,
                        child: IconButton(
                            icon: _isoldVisibility
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.blue[900],
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.blue[900],
                                  ),
                            onPressed: () {
                              setState(() {
                                if (_isoldVisibility) {
                                  _isoldVisibility = false;
                                } else {
                                  _isoldVisibility = true;
                                }
                              });
                            }),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      hintText: 'Old Password',
                      //     hintStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue[900]),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    //tra style: TextStyle(color: Colors.white),
                    controller: newPassword,
                    obscureText: _isnewVisibility ? false : true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Container(
                        width: 90,
                        child: IconButton(
                            icon: _isnewVisibility
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.blue[900],
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.blue[900],
                                  ),
                            onPressed: () {
                              setState(() {
                                print(_isnewVisibility);
                                _isnewVisibility = !_isnewVisibility;
                              });
                            }),
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,

                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      hintText: 'New Password',
                      //     hintStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('Update'),
                    onPressed: () async {
                      var result = await postApi(
                        'https://api.trabeely.com/api/users/update-password',
                        json.encode(
                          {
                            "password": newPassword.text,
                            "currentpassword": oldPassword.text
                          },
                        ),
                      );

                      print(result);
                      // api/story/dolike
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      )),
    );
  }
}
