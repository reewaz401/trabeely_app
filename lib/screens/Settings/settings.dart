import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/themeData.dart' as colors;

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('Dark Mode'),
              trailing: Consumer<colors.ThemeNotifier>(
                builder: (context, colors.ThemeNotifier value, child) {
                  return Switch(
                    value: !value.darkTheme,
                    onChanged: (theme) {
                      value.toggleTheme();
                    },
                  );
                },
              ),
            ),
            ListTile(
              title: Text('Language'),
              onTap: () {},
              trailing: Text(
                'English',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              title: Text('Currency'),
              onTap: () {},
              trailing: Text(
                'NPR',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
