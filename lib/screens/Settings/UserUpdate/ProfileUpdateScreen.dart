import 'package:flutter/material.dart';
import 'userProfileEdit.dart';
import 'updatePassword.dart';

class UpdateProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return ProfileData();
                },
              )),
              child: Container(
                color: Colors.red,
                height: 45,
                child: Row(
                  children: [
                    Icon(Icons.person),
                    Text('     My Information'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      Scaffold(body: Center(child: UpdatePassword()))),
              child: Container(
                color: Colors.red,
                height: 45,
                child: Row(
                  children: [
                    Icon(Icons.vpn_key_outlined),
                    Text('     Update Password'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
