import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:travel/components/customAlertBox.dart';
import 'package:travel/services/Api/postapi.dart';

import 'package:travel/widget/textField.dart';

class UpdatePassword extends StatefulWidget {
  @override
  _UpdatePasswordState createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final GlobalKey<FormState> _passKey = GlobalKey();
  bool _isoldVisibility = false;
  bool _isnewVisibility = false;
  final _opasswordFocusNode = FocusNode();
  final _npasswordFocusNode = FocusNode();
  Map<String, String> _passData = {'old': '', 'new': ''};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _passKey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue[900]),
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  //tra style: TextStyle(color: Colors.white),
                  focusNode: _opasswordFocusNode,

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
                    //     hintStyle: TextStyle(color: Colors.white)2
                  ),
                  onSaved: (value) {
                    _passData['old'] = value;
                    _passData['new'] = _passData['password'];
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue[900]),
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  focusNode: _npasswordFocusNode,
                  //tra style: TextStyle(color: Colors.white),

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
                  onSaved: (value) {
                    _passData['new'] = _passData['new'];
                    _passData['new'] = value;
                  },
                  validator: (value) {
                    if (value.length < 5) {
                      return ('The password should contains aleast 6 character');
                    } else if (value.isEmpty) {
                      return ('Enter some value');
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('Update'),
                    onPressed: () async {
                      _passKey.currentState.save();
                      var val = _passKey.currentState.validate();
                      if (!val) {
                        return null;
                      }
                      var result = await postApi(
                        'https://api.trabeely.com/api/users/update-password',
                        json.encode(
                          {
                            "password": _passData['new'],
                            "currentpassword": _passData['old']
                          },
                        ),
                      );
                      if (!result['success']) {
                        await CustomAlertBox().alertBox(
                            context: context,
                            contentMessage: result['message'],
                            errortitle: 'Check');
                        return null;
                      }
                      Navigator.of(context).pop();

                      // api/story/dolike
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
