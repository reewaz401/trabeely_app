import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:travel/screens/tabs_screen.dart';
import '../services/authentication.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../animation/animationButton.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:date_time_picker/date_time_picker.dart';
import '../model/SignupForm.dart';
import '../model/snackBar.dart';

enum AuthMode { Signup, Login }

class AuthFormWidget extends StatefulWidget {
  @override
  _AuthFormWidgetState createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  bool _isloading = false;
  //variable
  final GlobalKey<FormState> _formKeyLogIn = GlobalKey();
  final GlobalKey<FormState> _formKeySignUp = GlobalKey();

  //FocusNode
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  TextEditingController _passwordController = TextEditingController();

  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {'email': '', 'password': ''};

//SiginUp Form Var
  File _storedImage;
  String dob;
  TextEditingController _dobController =
      TextEditingController(text: DateTime.now().toString());
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
    //final statusBarSize = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _authMode == AuthMode.Login ? signinCard() : signupCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Custom Card
  Widget signinCard() {
    return Container(
      child: SizedBox(
        width: 350,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              height: 200,
              child: SvgPicture.asset('assets/images/authBackground.svg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'LET US GUIDE',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'DancingScript',
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Form(
                      key: _formKeyLogIn,
                      child: Column(
                        children: [
                          TextFormField(
                            focusNode: _emailFocusNode,
                            decoration: InputDecoration(labelText: 'email'),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            onFieldSubmitted: (value) => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
                            onSaved: (value) {
                              _authData['email'] = value;
                              _authData['password'] = _authData['password'];
                            },
                            validator: (value) {
                              if (!value.contains('@') &&
                                  !value.contains('.')) {
                                return ('Invalid email');
                              } else if (value.isEmpty) {
                                return ('Enter some value');
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            focusNode: _passwordFocusNode,
                            decoration: InputDecoration(labelText: 'password'),
                            textInputAction: TextInputAction.next,
                            obscureText: true,
                            onFieldSubmitted: (value) => FocusScope.of(context)
                                .requestFocus(_passwordFocusNode),
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
                          ),
                          signButton(),
                        ],
                      )),
                )),
            FlatButton(
                onPressed: _switchAuthMode,
                child: Column(
                    children: [Text('Sign Up'), Text('Don\'t have account?')])),
          ],
        ),
      ),
    );
  }

//////////////////////////////
  Widget signupCard() {
    return Form(
      key: _formKeySignUp,
      child: Column(
        children: [
          imagePlacer(),
          TextFormField(
            focusNode: _firstNameFocusNode,
            decoration: InputDecoration(labelText: 'Full Name'),
            textInputAction: TextInputAction.next,
            validator: (val) => validation('Full Name', val),
            onFieldSubmitted: (value) =>
                FocusScope.of(context).requestFocus(_lastNameFocusNode),
            onSaved: (newValue) => onSaved('fullName', newValue),
          ),
          TextFormField(
            focusNode: _lastNameFocusNode,
            decoration: InputDecoration(labelText: 'Conact Number'),
            textInputAction: TextInputAction.next,
            validator: (val) => validation('Contact number', val),
            onFieldSubmitted: (value) =>
                FocusScope.of(context).requestFocus(_addressFocusNode),
            onSaved: (newValue) => onSaved('contactNumber', newValue),
          ),
          TextFormField(
            focusNode: _addressFocusNode,
            decoration: InputDecoration(labelText: 'Address'),
            textInputAction: TextInputAction.next,
            validator: (val) => validation('Adress', val),
            onFieldSubmitted: (value) =>
                FocusScope.of(context).requestFocus(_passwordFocusNode),
            onSaved: (newValue) => onSaved('address', newValue),
          ),
          //datePicker(),
          //nationality(),
          TextFormField(
            focusNode: _emailFocusNode,
            decoration: InputDecoration(labelText: 'E-mail'),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: (val) => validation('Email', val),
            onFieldSubmitted: (value) =>
                FocusScope.of(context).requestFocus(_passwordFocusNode),
            onSaved: (newValue) => onSaved('email', newValue),
          ),
          TextFormField(
            focusNode: _passwordFocusNode,
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            textInputAction: TextInputAction.next,
            obscureText: true,
            validator: (val) => validation('Password', val),
            onFieldSubmitted: (value) =>
                FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
            onSaved: (newValue) => onSaved('password', newValue),
          ),
          TextFormField(
            focusNode: _confirmPasswordFocusNode,
            decoration: InputDecoration(labelText: 'Confirm Password'),
            textInputAction: TextInputAction.next,
            obscureText: true,
            validator: (val) => validation('Confirm Password', val),
            onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
          ),
          signButton()
        ],
      ),
    );
  }

  //Validation
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

//sigInButton
  Widget signButton() {
    return Builder(builder: (ctx) {
      return Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: ProgressButton(
            stateWidgets: {
              ButtonState.idle: Text(
                _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              ButtonState.loading: Text(
                "Loading",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            },
            stateColors: {
              ButtonState.idle: Colors.blue.shade400,
              ButtonState.loading: Colors.grey.shade300,
            },
            onPressed: () => _submit(ctx),
            state: _isloading ? ButtonState.loading : ButtonState.idle,
            padding: EdgeInsets.all(8.0),
          ),
        ),
      );
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  //image placer
  Widget imagePlacer() {
    return GestureDetector(
      onTap: () => imagePickerDialog(context),
      child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 0.45 * MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          width: 0.7 * MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: _storedImage == null
                ? Opacity(
                    opacity: 0.5,
                    child: Container(
                      color: Colors.grey,
                      child: Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ))
                : Image.file(
                    _storedImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
          )),
    );
  }

  void imagePickerDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Choose Method'),
            content: Text('Please choose the source of your image'),
            actions: [
              Column(
                children: [
                  FlatButton(
                      child: Text('Library'),
                      onPressed: () {
                        imageSource('Library', ctx)
                            .then((value) => Navigator.of(context).pop());
                      }),
                  FlatButton(
                    child: Text('Camera'),
                    onPressed: () {
                      imageSource('Camera', ctx)
                          .then((value) => Navigator.of(context).pop());
                    },
                  )
                ],
              )
            ],
          );
        });
  }

  Future<void> imageSource(String type, BuildContext ctx) async {
    final imageFile = await ImagePicker().getImage(
        source: type == 'Library' ? ImageSource.gallery : ImageSource.camera,
        maxWidth: 0.7 * MediaQuery.of(ctx).size.width);
    if (imageFile == null) {
      return;
    }
    final fileImage = File(imageFile.path);

    setState(() {
      _storedImage = File(imageFile.path);
    });
  }

  //DatePicker
  Widget datePicker() {
    return DateTimePicker(
        initialValue: null,
        type: DateTimePickerType.date,
        dateMask: 'd MMMM, yyyy',
        controller: _dobController,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        icon: Icon(Icons.event),
        dateLabelText: 'Date of Birth',
        onChanged: (newValue) {
          setState(() {
            dob = newValue;
          });
        },
        onSaved: null);
  }

  Widget nationality() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Nationality:'),
          CountryCodePicker(
              initialSelection: 'FR',
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              onChanged: null),
        ],
      ),
    );
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

  //Submit
  void _submit(BuildContext ctx) async {
    setState(() {
      _isloading = true;
    });
    if (_authMode == AuthMode.Login) {
      final _isValidate = _formKeyLogIn.currentState.validate();

      if (_isValidate) {
        _formKeyLogIn.currentState.save();

        try {
          await Provider.of<Auth>(context, listen: false)
              .signIn(_authData['email'].trim(), _authData['password'].trim());
          print('sucedss');
          Navigator.pushReplacementNamed(context, '/tabs-screen');
        } on HttpException catch (error) {
          CustomSnackBar().customSnackbar(ctx, error.toString());
        } catch (error) {
          CustomSnackBar()
              .customSnackbar(ctx, 'Check your internet connection');
        }
      } else {
        CustomSnackBar().customSnackbar(ctx, 'Invalid Field');
      }
    } else if (_authMode == AuthMode.Signup) {
      final _isValidate = _formKeySignUp.currentState.validate();
      FocusScope.of(context).unfocus();
      if (_isValidate) {
        _formKeySignUp.currentState.save();
        try {
          await Provider.of<Auth>(context, listen: false).signUp(_addingUser);
        } on HttpException catch (error) {
          CustomSnackBar().customSnackbar(ctx, error.toString());
        } catch (error) {
          CustomSnackBar()
              .customSnackbar(ctx, 'Check your internet connection');
        }
        setState(() {
          _isloading = false;
        });
      }
    }
  }
}
/* widget.signupSubmitFn(
            _addingUser.id,
            _addingUser.imageFile,
            _addingUser.firstname,
            _addingUser.lastname,
            _addingUser.nationality,
            _addingUser.dob,
            _addingUser.address,
            _addingUser.email,
            _addingUser.password);*/
