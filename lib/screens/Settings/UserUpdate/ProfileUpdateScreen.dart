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
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Information'),
            onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return ProfileData();
              },
            )),
          ),
          ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text('Change Password'),
              onTap: () => Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return UpdatePassword();
                    },
                  ))),
        ],
      ),
    );
  }
}
