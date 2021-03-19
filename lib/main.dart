import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/homePage/Category/category_screen.dart';
import 'package:travel/screens/homePage/components/categoryType_widget.dart';
import 'package:travel/screens/search_screen.dart';
import 'package:travel/services/tours_services.dart';
import './services/authentication.dart';
import './widget/isAuth.dart';
import './screens/auth_screen.dart';

import './screens/homePage//homePage_screen.dart';
import 'screens/user_profile_screen.dart';
import './screens/tabsScreen/tabs_screen.dart';
//import '../screens/tourPackDetails_screen.dart';
import './screens/storyFeedScreen/storyFeed_screen.dart';
import 'package:travel/screens/TestScreen/testpage.dart';

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

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (e) => Auth()),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            //supportedLocales: [Locale('pt', 'BR')],
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Rubik',
            ),
            home: TabsScreen(),
            // ? AuthScreen(false)
            // : auth.isAuth
            //     ? TabsScreen
            //     : AuthScreen(false),
            routes: {
              TabsScreen.routeName: (ctx) => TabsScreen(),
              PacakagesScreen.routeName: (ctx) => PacakagesScreen(),
              CategoryScreen.routeName: (ctx) => CategoryScreen(),
              StoryFeedScreen.routeName: (ctx) => StoryFeedScreen(),
            },
          ),
        ));
  }
} //main dart
