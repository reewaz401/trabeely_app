import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/screens/Settings/writeToUs.dart';
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
            listTile(context, 'Rate Us', WriteToUs(), Icons.room_preferences),
            listTile(context, 'Help Center', WriteToUs(), Icons.help),
            listTile(context, 'Feedback', WriteToUs(), Icons.feedback),
            listTile(context, 'Rate Us', WriteToUs(), Icons.stars)
          ],
        ),
      ),
    );
  }
}

Widget listTile(context, String title, route, IconData icon) {
  return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return route;
        }));
      },
      leading: Icon(icon));
}
