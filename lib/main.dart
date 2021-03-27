import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/Booking/bookinginfoDisplay.dart';
import 'package:travel/screens/Booking/bookingSucess.dart';
import 'package:travel/screens/SplashScreen/splashscreen.dart';
import 'package:travel/screens/homePage/Category/category_screen.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:travel/screens/homePage/homePage_screen.dart';

import 'package:travel/services/themeData.dart';
import './services/authentication.dart';

import './screens/auth_screen.dart';

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
    final String autoToken = prefs.getString('autoSignIn');
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
          )
        ],
        child:
            // ignore: missing_required_param
            Consumer(builder: (context, ThemeNotifier value, _) {
          return MaterialApp(
            //supportedLocales: [Locale('pt', 'BR')],
            debugShowCheckedModeBanner: false,

            title: 'Flutter Demo',
            theme: value.darkTheme ? light : dark,
            home: DoubleBack(
              message: "Press back again to close",
              child: SplashScreen(),
              //  isAuto ? TabsScreen() : AuthScreen(true),
            ),
            routes: {
              TabsScreen.routeName: (ctx) => TabsScreen(),
              HomePageScreen.routeName: (ctx) => HomePageScreen(),
              //PacakagesScreen.routeName: (ctx) => PacakagesScreen(),
              CategoryScreen.routeName: (ctx) => CategoryScreen(),
              StoryFeedScreen.routeName: (ctx) => StoryFeedScreen(),
              '/bookinginfo': (BuildContext context) => BookingInfo(),
              '/bookingconfirm': (BuildContext context) => BookingConfirm(),
            },
          );
        }));
  }
}
//main dart
