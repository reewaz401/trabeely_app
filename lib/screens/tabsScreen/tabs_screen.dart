import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/homePage/homePage_screen.dart';
import 'package:travel/screens/storyFeedScreen/storyFeed_screen.dart';
import '../user_profile_screen.dart';
import '../homePage/homePage_screen.dart';
import '../../services/authentication.dart';
import 'package:provider/provider.dart';
import '../../services/themeData.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  String userName;
  @override
  void initState() {
    _pages = [
      {'pages': HomePageScreen(), 'title': 'Home'},
      {'pages': StoryFeedScreen(), 'title': 'Story'},
      {'pages': UserProfileScreen(userName), 'title': 'Profile'}
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('username');
    super.didChangeDependencies();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(child: drawerList()),

      // drawer: AppDrawer(),

      appBar: AppBar(
        elevation: 0.0,
        //backgroundColor: Colors.blue.shade900,
        title: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(left: 20, top: 20),
          width: MediaQuery.of(context).size.width,
          child: _pages[_selectedPageIndex]['title'] == 'Home'
              ? SvgPicture.asset(
                  'assets/images/appLogo.svg',
                  height: 50,
                )
              : Text(_pages[_selectedPageIndex]['title'],
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30)),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important_outlined,
              color: Colors.white,
            ),
            onPressed: () async {},
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          ),
        ],
      ),

      body: SingleChildScrollView(child: _pages[_selectedPageIndex]['pages']),

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Color(0xFF0F367C),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.surround_sound), label: 'Story'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget drawerList() {
    return ListView(
      children: [
        DrawerHeader(
          child: Text(
            'Settings',
            style: TextStyle(fontSize: 25),
          ),
        ),
        ListTile(
          title: Text('Dark Mode'),
          trailing: Consumer<ThemeNotifier>(
            builder: (context, ThemeNotifier value, child) {
              return Switch(
                value: value.darkTheme,
                onChanged: (theme) {
                  value.toggleTheme();
                },
              );
            },
          ),
        ),
        ListTile(
          title: Text('Log out'),
          onTap: () {
            Provider.of<Auth>(context, listen: false).logOut();
          },
        ),
        ListTile(
          title: Text('Item 3'),
          onTap: () {},
        ),
      ],
    );
  }
}
