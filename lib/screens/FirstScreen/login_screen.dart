import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/services/authentication.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isloading = false;
  final GlobalKey<FormState> _formKeyLogIn = GlobalKey();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  Map<String, String> _authData = {'email': '', 'password': ''};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset('assets/images/logo.svg'),
            inputBox(),
            Container(
                child: Column(
              children: [
                button(),
                TextButton(
                    onPressed: () {},
                    child: Text('Do not have account ? Sign Up instead'))
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget inputBox() {
    return Form(
      key: _formKeyLogIn,
      child: Container(
          width: 0.8 * MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  focusNode: _emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.white)),
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
                    color: Colors.orange[300],
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  focusNode: _passwordFocusNode,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.vpn_key,
                        color: Colors.white,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.white)),
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

  Widget button() {
    return Container(
      width: 0.7 * MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        onPressed: () async {
          FocusScope.of(context).unfocus();
          setState(() {
            _isloading = true;
          });

          _formKeyLogIn.currentState.save();
          _formKeyLogIn.currentState.validate();
          await Auth()
              .signIn(context, _authData['email'], _authData['password']);
          setState(() {
            _isloading = false;
          });
        },
        child: Text(
          'Log In',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[700]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))),
      ),
    );
  }
}
