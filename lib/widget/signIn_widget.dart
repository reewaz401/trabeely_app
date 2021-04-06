import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/services/authentication.dart';
import '../screens/auth_screen.dart';
import 'package:travel/widget/signUp_widget.dart';

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  bool _isloading = false;
  final GlobalKey<FormState> _formKeyLogIn = GlobalKey();

  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();
  Map<String, String> _authData = {'email': '', 'password': ''};

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Spacer(
            flex: 4,
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Form(
                key: _formKeyLogIn,
                child: Column(
                  children: [
                    inputBox('email', context),
                    SizedBox(
                      height: 15,
                    ),
                    inputBox('password', context),
                    SizedBox(
                      height: 30,
                    ),

                    //normalButton()
                    //signButton(),
                  ],
                )),
          ),
          Spacer(
            flex: 1,
          ),
          _isloading
              ? CircularProgressIndicator(
                  backgroundColor: Colors.white,
                )
              : signInButton(),
          Spacer(
            flex: 4,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: FlatButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AuthScreen(false))), //_switchAuthMode,
                child: Column(children: [
                  Text(
                    'Don\'t have account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  )
                ])),
          )
        ]);
  }

  Widget inputBox(String type, BuildContext context) {
    return Container(
        width: 0.6 * MediaQuery.of(context).size.width,
        height: 35,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: type == 'email'
            ? TextFormField(
                focusNode: _emailFocusNode,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 15, bottom: 12, right: 15),
                    hintText: type,
                    hintStyle: TextStyle(fontSize: 15)),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
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
              )
            : TextFormField(
                focusNode: _passwordFocusNode,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                        EdgeInsets.only(left: 15, bottom: 12, right: 15),
                    hintText: 'password',
                    hintStyle: TextStyle(fontSize: 15)),
                textInputAction: TextInputAction.next,
                obscureText: true,
                onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
                onSaved: (value) {
                  _authData['email'] = _authData['email'];
                  _authData['password'] = value;
                },
                validator: (value) {
                  if (value.length < 5) {
                    return ('The password should contains aleast 6 character');
                  } else if (value.isEmpty) {
                    return ('Enter some value');
                  }
                  return null;
                },
              ));
  }

  Widget signInButton() {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(10)),
      child: FlatButton(
        child: Text(
          'SignIn',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          setState(() {
            _isloading = true;
          });
          _formKeyLogIn.currentState.validate();
          _formKeyLogIn.currentState.save();

          FocusScope.of(context).unfocus();
          await Auth().signIn(context, 'user@gmail.com', 'trabeely@');
          setState(() {
            _isloading = false;
          });
        },
      ),
    );
  }

  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }
}
