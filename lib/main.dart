import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/homePage/Category/category_screen.dart';
import 'package:travel/screens/homePage/components/categoryType_widget.dart';
import 'package:travel/screens/homePage/homePage_screen.dart';

import 'package:travel/services/tours_services.dart';
import 'package:travel/services/themeData.dart';
import './services/authentication.dart';
import './widget/isAuth.dart';
import './screens/auth_screen.dart';

import 'screens/user_profile_screen.dart';
import './screens/tabsScreen/tabs_screen.dart';
//import '../screens/tourPackDetails_screen.dart';
import './screens/storyFeedScreen/storyFeed_screen.dart';
import 'package:provider/provider.dart';
import './services/authentication.dart';

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
            theme: value.darkTheme ? dark : light,
            home: isAuto ? TabsScreen() : AuthScreen(true),
            routes: {
              TabsScreen.routeName: (ctx) => TabsScreen(),
              HomePageScreen.routeName: (ctx) => HomePageScreen(),
              //PacakagesScreen.routeName: (ctx) => PacakagesScreen(),
              CategoryScreen.routeName: (ctx) => CategoryScreen(),
              StoryFeedScreen.routeName: (ctx) => StoryFeedScreen(),
            },
          );
        }));
  }
}
//main dart
