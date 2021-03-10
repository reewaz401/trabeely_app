import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/screens/tabsScreen/components/drawerList_widget.dart';
import 'package:travel/screens/tabsScreen/components/endDrawer_widget.dart';
import '../../screens/homePage/homePage_screen.dart';
import 'package:travel/screens/storyFeed_screen.dart';
import '../user_profile_screen.dart';
import '../homePage/homePage_screen.dart';
import 'components/drawerList_widget.dart';
import '../search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum FilterOption { AcceptedRequest, AllRequest, AddRequest }

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  bool _showAllReq = true;
  FilterOption _popTypeReq = FilterOption.AllRequest;
  @override
  void initState() {
    print(_showAllReq);
    _pages = [
      {'pages': HomePage(), 'title': 'Home'},
      {'pages': StoryFeedScreen(), 'title': 'Story'},
      {'pages': UserProfileScreen(), 'title': 'Profile'}
    ];
    super.initState();
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
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left: 20),
          width: MediaQuery.of(context).size.width,
          child: _pages[_selectedPageIndex]['title'] == 'Home'
              ? SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 70,
                )
              : Text(_pages[_selectedPageIndex]['title'],
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xFF245AA0),
                      fontWeight: FontWeight.w500,
                      fontSize: 30)),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important_outlined,
              color: Color(0xFF245AA0),
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color(0xFF245AA0),
            ),
            onPressed: () => _scaffoldKey.currentState.openEndDrawer(),
          ),
        ],
      ),

      body: _pages[_selectedPageIndex]['pages'],

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Color(0xFF0F367C),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Home'),
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
          child: Text('Settings'),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Item 3'),
          onTap: () {},
        ),
      ],
    );
  }
}
