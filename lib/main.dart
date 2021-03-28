import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/Booking/bookinginfoDisplay.dart';
import 'package:travel/screens/Booking/bookingSucess.dart';
import 'package:travel/screens/SplashScreen/splashscreen.dart';
import 'package:travel/screens/homePage/Category/category_screen.dart';
import 'package:travel/screens/Onboarding/Slider.dart';

import 'package:travel/services/themeData.dart';
import './services/authentication.dart';

import './screens/auth_screen.dart';
import './services/themeData.dart';
import './screens/homePage//homePage_screen.dart';
import 'screens/user_profile_screen.dart';
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
        child: Consumer<Auth>(
          builder: (ctx, auth, _) =>
              Consumer(builder: (context, ThemeNotifier value, _) {
            return MaterialApp(
                //supportedLocales: [Locale('pt', 'BR')],
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: light,
                home: SliderHome(),
                // ? AuthScreen(false)
                // : auth.isAuth
                //     ? TabsScreen
                //     : AuthScreen(false),
                routes: {
                  TabsScreen.routeName: (ctx) => TabsScreen(),
                  CategoryScreen.routeName: (ctx) => CategoryScreen(),
                  StoryFeedScreen.routeName: (ctx) => StoryFeedScreen(),
                  '/bookinginfo': (BuildContext context) => BookingInfo(),
                });
          }),
        ));
  }
}
//main dart
