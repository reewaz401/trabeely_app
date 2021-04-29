import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/components/button.dart';
import 'package:travel/screens/FirstScreen/signup_screen.dart';
import 'package:travel/services/authentication.dart';
import 'package:travel/services/deviceSize.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isloading = false;
  bool _isVisibility = false;
  final GlobalKey<FormState> _formKeyLogIn = GlobalKey();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  Map<String, String> _authData = {'email': '', 'password': ''};
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 0.263 * deviceSize.height,
                  width: 0.9 * deviceSize.width,
                  child: SvgPicture.asset('assets/images/logo.svg')),
              inputBox(),
              Container(
                  child: Column(
                children: [
                  //     button(),
                  Container(
                      child: !_isloading
                          ? Button(
                              text: 'Log In',
                              callback: () {
                                myLoginMethod();
                              })
                          : Center(
                              child: CircularProgressIndicator(),
                            )),
                  TextButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => SignUpScreen())),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Do not have account?  ',
                            style: TextStyle(color: Colors.grey[700])),
                        TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline))
                      ])))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget inputBox() {
    return Form(
      key: _formKeyLogIn,
      child: Container(
          width: kwtextfield * MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue[900]),
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  focusNode: _emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  //     style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.email,
                      color: Colors.blue[900],
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    hintText: 'Email',
                    //hintStyle: TextStyle(color: Colors.orange)
                  ),
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_passwordFocusNode),
                  onSaved: (value) {
                    _authData['email'] = value;
                    _authData['password'] = _authData['password'];
                  },
                  validator: (value) {
                    if (!value.contains('@') && !value.contains('.')) {
                      return ('Invalid email');
                    } else if (value.isEmpty) {
                      return ('Enter some value');
                    }
                    return null;
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
                  focusNode: _passwordFocusNode,
                  //tra style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.name,
                  obscureText: _isVisibility ? false : true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Container(
                      width: 90,
                      child: Row(
                        children: [
                          IconButton(
                              icon: _isVisibility
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
                                  if (_isVisibility) {
                                    _isVisibility = false;
                                  } else {
                                    _isVisibility = true;
                                  }
                                });
                              }),
                          Icon(
                            Icons.vpn_key,
                            color: Colors.blue[900],
                          ),
                        ],
                      ),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    hintText: 'Password',
                    //     hintStyle: TextStyle(color: Colors.white)
                  ),
                  onSaved: (value) {
                    _authData['email'] = _authData['email'];
                    _authData['password'] = value;
                  },
                  onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
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
            ],
          )),
    );
  }

  myLoginMethod() async {
    FocusScope.of(context).unfocus();
    var validation = _formKeyLogIn.currentState.validate();
    if (validation) {
      _formKeyLogIn.currentState.save();
      setState(() {
        _isloading = true;
      });

      _formKeyLogIn.currentState.save();
      _formKeyLogIn.currentState.validate();
      await Auth().signIn(
          context, _authData['email'].trim(), _authData['password'].trim());
      setState(() {
        _isloading = false;
      });
    }
  }
}
