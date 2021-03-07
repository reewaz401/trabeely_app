/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/authForm_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isloading = false;

  /* void _signInAuthForm(BuildContext ctx,
      [String email,
      String password,
      bool islogin,
      String id,
      String imageFile,
      String firstname,
      String lastname,
      String nationality,
      String dob,
      String address,
      String semail,
      String spassword]) async {
    AuthResult authResult;
    try {
      setState(() {
        _isloading = true;
      });
      if (islogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        setState(() {
          _isloading = false;
        });
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: semail, password: spassword);
        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({
          'email': semail,
          'firstname': firstname,
          'lastname': lastname,
          'address': address,
          'dob': dob,
          'nationality': nationality
        });
      }
    } on PlatformException catch (error) {
      var message = 'An error occured, Please check your credentials';
      if (error != null) {
        message = error.message;
      }
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));
      setState(() {
        _isloading = false;
      });
    } catch (error) {
      setState(() {
        _isloading = false;
      });
      print(error);
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthFormWidget(),
    );
  }
}
*/
