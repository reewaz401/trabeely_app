import 'package:flutter/material.dart';

class SignupForm with ChangeNotifier {
  final String imageFile;
  final String fullName;
  final String contactNumber;
  final String address;
  final String email;
  final String password;
  SignupForm(
      {@required this.imageFile,
      @required this.fullName,
      @required this.contactNumber,
      @required this.address,
      @required this.email,
      @required this.password});
}
