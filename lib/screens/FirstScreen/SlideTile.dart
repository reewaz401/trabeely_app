import 'package:flutter/material.dart';
import 'package:travel/components/button.dart';
import 'package:travel/model/SignupForm.dart';
import 'package:travel/screens/FirstScreen/one.dart';
import 'package:travel/services/authentication.dart';
import 'package:travel/services/deviceSize.dart';
import 'package:velocity_x/velocity_x.dart';

class SlideTile extends StatefulWidget {
  final int index;
  SlideTile(this.index);

  @override
  _SlideTileState createState() => _SlideTileState();
}

class _SlideTileState extends State<SlideTile> {
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
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _formKeySignUp,
        child: Column(
          children: [
            first(deviceSize),
            second(deviceSize),
            third(deviceSize),
            SizedBox(
              height: 20,
            ),
            Container(
              child: !_isloading
                  ? Button(
                      text: 'Sign Up',
                      callback: () {
                        mySignupMethod();
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            )
          ],
        ),
      ),
    );
  }

  Widget first(Size deviceSize) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.blue[900],
                  size: 20,
                ),
                onPressed: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => OneScreen()))),
          ],
        ),
        SizedBox(
          height: tspacing * deviceSize.height,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'General Information',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            Container(
              child: Icon(
                Icons.person,
                color: Colors.blue,
                size: 20,
              ),
            )
          ],
        ),
        SizedBox(
          height: tpaddng * deviceSize.height,
        ),
        inputBox('Full Name', context),
        SizedBox(
          height: tspacing * deviceSize.height,
        ),
        gender(),
      ],
    ));
  }

  Widget second(Size deviceSize) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (tpaddng + tpaddng) * deviceSize.height,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Verification',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            Container(
                child: Icon(
              Icons.mail,
              color: Colors.blue,
              size: 20,
            ))
          ],
        ),
        SizedBox(
          height: (tspacing + tspacing) * deviceSize.height,
        ),
        inputBox('Email', context),
        SizedBox(
          height: tspacing * deviceSize.height,
        ),
        inputBox('Contact Number', context),
      ],
    ));
  }

  Widget third(Size deviceSize) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: (tpaddng + tpaddng) * deviceSize.height,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Security',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
            Container(
              child: Icon(
                Icons.security,
                color: Colors.blue,
                size: 20,
              ),
            )
          ],
        ),
        SizedBox(
          height: (tspacing + tspacing) * deviceSize.height,
        ),
        inputBox('Password', context),
        SizedBox(
          height: tspacing * deviceSize.height,
        ),
        inputBox('Confirm Password', context),
      ],
    ));
  }

  Widget inputBox(String type, BuildContext context) {
    return Container(
      //height: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.blue[900]),
          borderRadius: BorderRadius.circular(15)),
      child: type == 'Full Name'
          ? TextFormField(
              focusNode: _firstNameFocusNode,
              //  style: TextStyle(color: Colors.white),
              decoration: new InputDecoration(
                  suffixIcon: Icon(
                    Icons.person,
                    color: Colors.blue[900],
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  // errorBorder: InputBorder.none,

                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  hintText: type,
                  hintStyle: TextStyle(
                    fontSize: 13,
                  )),
              textInputAction: TextInputAction.next,
              validator: (val) => validation('Full Name', val),
              onFieldSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(_lastNameFocusNode),
              onSaved: (newValue) => onSaved('fullName', newValue),
            )
          : type == 'Contact Number'
              ? TextFormField(
                  focusNode: _lastNameFocusNode,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.call,
                        color: Colors.blue[900],
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 12, right: 15, top: 15),
                      hintText: type,
                      hintStyle: TextStyle(
                        fontSize: 15,
                      )),
                  textInputAction: TextInputAction.next,
                  validator: (val) => validation('Contact number', val),
                  onFieldSubmitted: (value) =>
                      FocusScope.of(context).requestFocus(_addressFocusNode),
                  onSaved: (newValue) => onSaved('contactNumber', newValue),
                )
              : type == 'Email'
                  ? TextFormField(
                      focusNode: _emailFocusNode,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.blue[900],
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 12, right: 15, top: 15),
                          hintText: type,
                          hintStyle: TextStyle(
                            fontSize: 15,
                          )),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) => validation('Email', val),
                      onFieldSubmitted: (value) => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      onSaved: (newValue) => onSaved('email', newValue),
                    )
                  : type == 'Password'
                      ? TextFormField(
                          focusNode: _passwordFocusNode,
                          controller: _passwordController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.blue[900],
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 12, right: 15, top: 15),
                              hintText: type,
                              hintStyle: TextStyle(
                                fontSize: 15,
                              )),
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          validator: (val) => validation('Password', val),
                          onFieldSubmitted: (value) => FocusScope.of(context)
                              .requestFocus(_confirmPasswordFocusNode),
                          onSaved: (newValue) => onSaved('password', newValue),
                        )
                      : TextFormField(
                          focusNode: _confirmPasswordFocusNode,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.blue[900],
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 12, right: 15, top: 15),
                              hintText: type,
                              hintStyle: TextStyle(
                                fontSize: 15,
                              )),
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                          validator: (val) =>
                              validation('Confirm Password', val),
                          onFieldSubmitted: (value) {
                            _formKeySignUp.currentState.save();
                            FocusScope.of(context).unfocus();
                          }),
    );
  }

  String validation(String type, String value) {
    switch (type) {
      case 'Email':
        if (!value.contains('@') || !value.contains('.com')) {
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

  Widget gender() {
    return Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: 0.9 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blue[900]),
            borderRadius: BorderRadius.circular(15)),
        child: DropdownButton<String>(
          hint: Text('Gender'),
          value: dropdownValue,
          isExpanded: true,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          onChanged: (newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: [
            'Male',
            'Female',
            'Others',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  mySignupMethod() async {
    _formKeySignUp.currentState.validate();
    _formKeySignUp.currentState.save();
    setState(() {
      _isloading = true;
    });
    await Auth().signUp(_addingUser);
    setState(() {
      _isloading = false;
    });
  }
}
