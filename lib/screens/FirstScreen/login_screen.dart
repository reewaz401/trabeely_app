import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/screens/FirstScreen/signup_screen.dart';
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  height: 170,
                  width: 0.9 * MediaQuery.of(context).size.width,
                  child: SvgPicture.asset('assets/images/loginLogo.svg')),
              inputBox(),
              Container(
                  child: Column(
                children: [
                  button(),
                  TextButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => SignUpScreen())),
                      child: Text('Do not have account ? Sign Up instead'))
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
          width: 0.8 * MediaQuery.of(context).size.width,
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
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.vpn_key,
                      color: Colors.blue[900],
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
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

  Widget button() {
    return Container(
      width: 0.7 * MediaQuery.of(context).size.width,
      height: 50,
      child: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : TextButton(
              onPressed: () async {
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
                      context, _authData['email'], _authData['password']);
                  setState(() {
                    _isloading = false;
                  });
                }
              },
              child: Text(
                'Log In',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange[900]),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ))),
            ),
    );
  }
}
