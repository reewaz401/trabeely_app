import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/SignupForm.dart';
import '../screens/auth_screen.dart';

class SignUpWidget extends StatefulWidget {
  //static final GlobalKey<FormState> _formKeySignUp = GlobalKey();

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  bool _isloading = false;
  final _formKeySignUp = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();

  final FocusNode _passwordFocusNode = FocusNode();

  final FocusNode _firstNameFocusNode = FocusNode();

  final FocusNode _lastNameFocusNode = FocusNode();

  final FocusNode _addressFocusNode = FocusNode();

  final FocusNode _confirmPasswordFocusNode = FocusNode();

  TextEditingController _passwordController = TextEditingController();

  var _addingUser = SignupForm(
      imageFile: null,
      fullName: null,
      contactNumber: null,
      address: null,
      email: null,
      password: null);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                inputBox('full name', context),
                SizedBox(
                  height: 8,
                ),
                inputBox('contact number', context),
                SizedBox(
                  height: 8,
                ),
                inputBox('email', context),
                SizedBox(
                  height: 8,
                ),
                inputBox('password', context),
                SizedBox(
                  height: 8,
                ),
                inputBox('confirm password', context),
                SizedBox(
                  height: 23,
                ),
                _isloading
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    : signUpButton(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: FlatButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AuthScreen(true))),
                child: Column(children: [
                  Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Have account ?',
                    style: TextStyle(color: Colors.white),
                  )
                ])),
          ),
        ],
      ),
    );
  }

  Widget inputBox(String type, BuildContext context) {
    return Container(
      width: 0.7 * MediaQuery.of(context).size.width,
      height: 35,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: type == 'full name'
          ? TextFormField(
              focusNode: _firstNameFocusNode,
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
              validator: (val) => validation('Full Name', val),
              onFieldSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(_lastNameFocusNode),
              onSaved: (newValue) => onSaved('fullName', newValue),
            )
          : type == 'contact number'
              ? TextFormField(
                  focusNode: _lastNameFocusNode,
                  decoration: InputDecoration(
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
                  validator: (val) => validation('Contact number', val),
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_addressFocusNode),
                  onSaved: (newValue) => onSaved('contactNumber', newValue),
                )
              : type == 'email'
                  ? TextFormField(
                      focusNode: _emailFocusNode,
                      decoration: InputDecoration(
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
                      validator: (val) => validation('Email', val),
                      onFieldSubmitted: (value) => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      onSaved: (newValue) => onSaved('email', newValue),
                    )
                  : type == 'password'
                      ? TextFormField(
                          focusNode: _passwordFocusNode,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 12, right: 15),
                              hintText: type,
                              hintStyle: TextStyle(fontSize: 15)),
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          validator: (val) => validation('Password', val),
                          onFieldSubmitted: (value) => FocusScope.of(context)
                              .requestFocus(_confirmPasswordFocusNode),
                          onSaved: (newValue) => onSaved('password', newValue),
                        )
                      : TextFormField(
                          focusNode: _confirmPasswordFocusNode,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 12, right: 15),
                              hintText: type,
                              hintStyle: TextStyle(fontSize: 15)),
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          validator: (val) =>
                              validation('Confirm Password', val),
                          onFieldSubmitted: (value) =>
                              FocusScope.of(context).unfocus(),
                        ),
    );
  }

  String validation(String type, String value) {
    switch (type) {
      case 'Email':
        if (!value.contains('@') && !value.contains('.com')) {
          return ('enter a valid email');
        }
        break;
      case 'Password':
        if (value.length < 6) {
          return ('should be atleast 6 characters long');
        }
        break;
      case 'Confirm Password':
        if (_passwordController.text != value) {
          return ('password does not match');
        }
        break;
    }
    if (value.isEmpty) {
      return ('missing field');
    }
    return null;
  }

  void onSaved(String type, String newValue) {
    _addingUser = SignupForm(
        imageFile: type == 'imageFile' ? newValue : _addingUser.imageFile,
        fullName: type == 'fullName' ? newValue : _addingUser.fullName,
        contactNumber:
            type == 'contactNumber' ? newValue : _addingUser.contactNumber,
        address: type == 'address' ? newValue : _addingUser.address,
        email: type == 'email' ? newValue : _addingUser.email,
        password: type == 'password' ? newValue : _addingUser.password);
  }

  Widget signUpButton() {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(10)),
      child: FlatButton(
        child: Text(
          'SignUp',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          setState(() {
            _isloading = true;
          });
        },
      ),
    );
  }
}
