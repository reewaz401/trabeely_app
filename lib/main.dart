import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/search_screen.dart';
import 'package:travel/services/tours_services.dart';
import './services/authentication.dart';
import './widget/isAuth.dart';
import './screens/authForm_widget.dart';
import './widget/search_widget.dart';
import './screens/homePage.dart';
import 'screens/user_profile_screen.dart';
import './screens/tabs_screen.dart';
import './screens/tourPackDetails_screen.dart';
import './screens/storyFeed_screen.dart';
import 'package:provider/provider.dart';
import './services/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
            home: isAuto
                ? TabsScreen()
                : auth.isAuth
                    ? TabsScreen()
                    : AuthFormWidget(),
            routes: {
              TabsScreen.routeName: (ctx) => TabsScreen(),
              PacakagesScreen.routeName: (ctx) => PacakagesScreen(),
            },
          ),
        ));
  }
} //main dart
