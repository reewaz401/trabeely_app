import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/Settings/writeToUs.dart';
import 'package:travel/screens/homePage/components/search_widget.dart';

import '../../screens/homePage/homePage_screen.dart';
import 'package:travel/screens/storyFeedScreen/storyFeed_screen.dart';
import '../user_profile_screen.dart';
import '../homePage/homePage_screen.dart';
import '../../services/authentication.dart';
import '../../services/themeData.dart' as colors;
import 'package:provider/provider.dart';
import 'package:travel/screens/Booking/bookingHistory.dart';
import 'package:travel/screens/Settings/settings.dart';
import 'package:travel/screens/ExtraScreens/qrScanned.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';
  final String destination;
  TabsScreen([this.destination]);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool _isloading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  String userName;
  String qrCodeResult = "Not Yet Scanned";

  @override
  void initState() {
    _pages = [
      {'pages': HomePageScreen(), 'title': 'Home'},
      {'pages': StoryFeedScreen(), 'title': 'Story'},
      {'pages': UserProfileScreen(), 'title': 'Profile'}
    ];
    super.initState();
  }

  @override
  void didChangeDependencies() async {
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
                    flexibleSpace: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/anna2.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        FlexibleSpaceBarSettings(
                          currentExtent: 0.0,
                          minExtent: 0,
                          maxExtent: 230,
                          toolbarOpacity: 1,
                          child: FlexibleSpaceBar(
                            titlePadding: EdgeInsetsDirectional.only(
                                start: 30, bottom: 15),
                            title: GestureDetector(
                              onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SearchWidget('')));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 50),
                                width: 0.75 * MediaQuery.of(context).size.width,
                                height: 50,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    color: Color(0xFF4579B2).withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.destination,
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
                      ],
                    ),
                  ),
                ];
              },
              body: _pages[_selectedPageIndex]['pages'],
            )
          : _pages[_selectedPageIndex]['pages'],

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Colors.orange[900], //Color(0xFF0F367C),
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
          title: Text('Settings'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => Settings(),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Booking History'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => BookingHistory(),
              ),
            );
          },
        ),
        ListTile(
          title: Text('Scan Qr'),
          onTap: () async {
            String codeSanner = await BarcodeScanner.scan(); //barcode scnner
            setState(() {
              qrCodeResult = codeSanner;
              print(qrCodeResult);
            });
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return QrScanned(qrCodeResult);
            }));
          },
        ),
        ListTile(
            title: Text('Write To Us'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => WriteToUs(),
                ),
              );
            }),
        ListTile(
          title: _isloading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Text('Log out'),
          onTap: () async {
            setState(() {
              _isloading = true;
            });
            Provider.of<Auth>(context, listen: false).logOut(context);
            setState(() {
              _isloading = false;
            });
          },
        ),
      ],
    );
  }
}
