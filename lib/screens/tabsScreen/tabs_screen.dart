import 'package:barcode_scan_fix/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/components/uploadPhoto.dart';
import 'package:travel/screens/CreateTour/createTour.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/screens/Settings/helpCenter.dart';
import 'package:travel/screens/Settings/UserUpdate/userProfileEdit.dart';
import 'package:travel/screens/Settings/writeToUs.dart';
import 'package:travel/screens/homePage/components/search_widget.dart';
import 'package:travel/screens/Settings/UserUpdate/ProfileUpdateScreen.dart';
import 'package:travel/services/isLogin.dart';

import '../../screens/homePage/homePage_screen.dart';
import 'package:travel/screens/storyFeedScreen/storyFeed_screen.dart';
import '../UserProile/user_profile_screen.dart';
import '../homePage/homePage_screen.dart';
import '../../controller/authentication.dart';
import '../../services/themeData.dart' as colors;
import 'package:provider/provider.dart';
import 'package:travel/screens/Booking/bookingHistory.dart';
import 'package:travel/screens/Settings/settings.dart';

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
  String istoken;
  String userName;
  String qrCodeResult = "Not Yet Scanned";

  @override
  void initState() {
    _pages = [
      {'pages': HomePageScreen(), 'title': 'Home'},
      {'pages': StoryFeedScreen(), 'title': 'Story'},
      {'pages': UserProfileScreen(), 'title': 'Profile'}
    ];
    Islogin().getToken().then((value) => setState(() {
          istoken = value;
        }));

    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
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
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      widget.destination,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                      textAlign: TextAlign.left,
                                    ),
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
        selectedItemColor: Color(0xFFF7931E), //Color(0xFF0F367C),
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
            'Menu',
            style: TextStyle(fontSize: 25),
          ),
        ),

        ListTile(
          leading: SvgPicture.asset(
            'assets/images/settings.svg',
            height: 30,
          ),
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
          leading: Icon(Icons.bookmark),
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
          leading: SvgPicture.asset(
            'assets/images/help.svg',
            height: 30,
          ),
          title: Text('Help Center'),
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
          leading: SvgPicture.asset(
            'assets/images/feedback.svg',
            height: 30,
          ),
          title: Text('Feedback'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => WriteToUs(),
              ),
            );
          },
        ),
        // ListTile(
        //   leading: Icon(Icons.qr_code),
        //   title: Text('Scan Qr'),
        //   onTap: () async {
        //     String codeSanner = await BarcodeScanner.scan(); //barcode scnner
        //     setState(() {
        //       qrCodeResult = codeSanner;
        //       print(qrCodeResult);
        //     });
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return QrScanned(qrCodeResult);
        //     }));
        //   },
        // ),
        listTile(context, "My Profile", UpdateProfile(), Icons.person_pin),
        
        istoken == null
            ? ListTile()
            : ListTile(
                leading: Icon(Icons.logout),
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
