import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/components/data.dart';
import 'package:travel/screens/Booking/bookinginfoDisplay.dart';
import 'package:travel/screens/FirstScreen/login_screen.dart';
import 'package:travel/screens/FirstScreen/one.dart';
import 'package:travel/screens/SplashScreen/splashscreen.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/FilterData.dart';

import 'package:travel/services/themeData.dart';
import './services/authentication.dart';
import './screens/auth_screen.dart';
import './services/themeData.dart';
import './screens/tabsScreen/tabs_screen.dart';
import './screens/storyFeedScreen/storyFeed_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAuto = false;
  @override
  void initState() {
    autoSignIn();

    super.initState();
  }

  void autoSignIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String autoToken = prefs.getString('userToken');
    if (autoToken != null) {
      setState(() {
        isAuto = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (e) => Auth()),
          ChangeNotifierProvider(
            create: (a) => ThemeNotifier(),
          ),
          ChangeNotifierProvider(
            create: (e) => FilterData(),
          ),
          ChangeNotifierProvider(
            create: (e) => InitialSetPrice(),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) =>
              Consumer(builder: (context, ThemeNotifier value, _) {
            return MaterialApp(
                // supportedLocales: [Locale('pt', 'BR')],
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: value.darkTheme ? light : dark,
                home: SplashScreen(),
                routes: {
                  TabsScreen.routeName: (ctx) =>
                      TabsScreen('Search Destination'),
                  StoryFeedScreen.routeName: (ctx) => StoryFeedScreen(),
                  '/bookinginfo': (BuildContext context) => BookingInfo(),
                });
          }),
        ));
  }
}
//main dart
