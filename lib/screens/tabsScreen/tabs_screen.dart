import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/tabsScreen/components/drawerList_widget.dart';
import 'package:travel/screens/tabsScreen/components/endDrawer_widget.dart';
import 'package:travel/services/tours_services.dart';
import '../../screens/homePage/homePage_screen.dart';
import 'package:travel/screens/storyFeedScreen/storyFeed_screen.dart';
import '../user_profile_screen.dart';
import '../homePage/homePage_screen.dart';
import '../../services/themeData.dart' as colors;
import 'package:provider/provider.dart';
import 'components/drawerList_widget.dart';
import '../search_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
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
      appBar: _pages[_selectedPageIndex]['title'] == 'Home'
          ? null
          : AppBar(
              centerTitle: false,
              title: Text((_pages[_selectedPageIndex]['title'])),
            ),
      // drawer: AppDrawer(),

      body: _pages[_selectedPageIndex]['title'] == 'Home'
          ? NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScroll) {
                return [
                  SliverAppBar(
                    // Add this code
                    bottom: PreferredSize(
                      // Add this code
                      preferredSize: Size.fromHeight(20.0),
                      child: Text(''),
                    ),
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBarSettings(
                      currentExtent: 0.0,
                      minExtent: 0,
                      maxExtent: 230,
                      toolbarOpacity: 1,
                      child: FlexibleSpaceBar(
                        titlePadding:
                            EdgeInsetsDirectional.only(start: 30, bottom: 15),
                        title: GestureDetector(
                          onTap: () async {},
                          child: Container(
                            margin: EdgeInsets.only(right: 50),
                            width: 0.75 * MediaQuery.of(context).size.width,
                            height: 50,
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                                color: Color(0xFF4579B2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Search Destinaiton',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ];
              },
              body: _pages[_selectedPageIndex]['pages'],
            )
          : _pages[_selectedPageIndex]['pages'],

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
          title: Text('Dark Mode'),
          trailing: Consumer<colors.ThemeNotifier>(
            builder: (context, colors.ThemeNotifier value, child) {
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

/* child: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue[900],
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
                    style: TextStyle(
                        color: Color(0xFF245AA0),
                        fontWeight: FontWeight.w500,
                        fontSize: 30)),
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
        ),*/
