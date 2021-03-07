import 'package:flutter/material.dart';
import '../screens/homePage.dart';
import '../screens/storyFeed_screen.dart';
import 'user_profile_screen.dart';
import 'homePage.dart';
import 'search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum FilterOption { AcceptedRequest, AllRequest, AddRequest }

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  bool _showAllReq = true;
  FilterOption _popTypeReq = FilterOption.AllRequest;
  @override
  void initState() {
    print(_showAllReq);
    _pages = [
      {'pages': HomePage(), 'title': 'Scout'},
      {'pages': PacakagesScreen(), 'title': 'Search'},
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
      // drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          width: double.infinity,
          child:
              /* Text(
                      _pages[0]['title'],
                      style: TextStyle(
                        color: _selectedPageIndex == 0
                            ? Colors.blue[900]
                            : Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(_pages[1]['title'],
                        style: TextStyle(
                            color: _selectedPageIndex == 1
                                ? Colors.blue[900]
                                : Colors.grey)),
                    SizedBox(
                      width: 70,
                    ),
                    Text(_pages[2]['title'],
                        style: TextStyle(
                            color: _selectedPageIndex == 2
                                ? Colors.blue[900]
                                : Colors.grey)),
                    SizedBox(
                      width: 70,
                    ),*/
              Text(_pages[_selectedPageIndex]['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[900], fontWeight: FontWeight.w500)),
        ),

        /* actions: [
          DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 8,
                        ),
                        Text('logout')
                      ],
                    ),
                  ),
                  value: 'logout',
                )
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              })
          /*PopupMenuButton(
            onSelected: (FilterOption selectedvalue) {
                 if (selectedvalue == FilterOption.AddRequest) {
                Navigator.pushNamed(context, PacakagesScreen.routeName);
              } 
              else if (selectedvalue == FilterOption.AcceptedRequest) {
                setState(() {
                  _popTypeReq = FilterOption.AllRequest;
                  _showAllReq = false;

                  print(_popTypeReq);
                });
              } else if (selectedvalue == FilterOption.AllRequest) {
                setState(() {
                  _popTypeReq = FilterOption.AcceptedRequest;
                  _showAllReq = true;
                  print(_popTypeReq);
                });
              }
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Add New Request'),
                value: FilterOption.AddRequest,
              ),
              PopupMenuItem(
                child: Text(_popTypeReq == FilterOption.AllRequest
                    ? 'Accepted Request'
                    : 'Ongoing Request'),
                value: _popTypeReq == FilterOption.AllRequest
                    ? FilterOption.AllRequest
                    : FilterOption.AcceptedRequest,
              )
            ],
          )*/
        ],*/
      ),
      body: _pages[_selectedPageIndex]['pages'],

      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), label: 'Homepage'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.surround_sound), label: 'Story'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
