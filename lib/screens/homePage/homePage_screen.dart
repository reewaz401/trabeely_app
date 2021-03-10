import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/components/searchBox.dart';
import 'package:travel/screens/homePage/components/search_widget.dart';

//import '../search_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _typePacakge = ['All', 'Tours', 'Trek', 'Hotels', 'Restaurant', 'Clubs'];
  var _currentSelectType = 'All';
  @override
  void initState() {
    final fbm = FirebaseMessaging();
    fbm.requestNotificationPermissions();
    fbm.configure(
      onMessage: (msg) {
        print(msg);
        return;
      },
      onLaunch: (msg) {
        print(msg);
        return;
      },
      onResume: (msg) {
        print(msg);
        return;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //destinattion
    String destination;
    String finaldestination;
    var deviceSize = MediaQuery.of(context).size;
    var paddingSize = MediaQuery.of(context).padding.top;
    return Container(
        height: deviceSize.height,
        width: deviceSize.width,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                  onTap: () async {
                    print(MediaQuery.of(context).size.width);
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchWidget()))
                        .then((result) {
                      setState(() {
                        finaldestination = result;
                      });
                      print(finaldestination);
                    });
                  },
                  child: Container(
                    width: 0.9 * deviceSize.width,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      'Search Destinaiton',
                      textAlign: TextAlign.left,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  type('All'),
                  type('Tours'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  type('Hotels'),
                  type('Treks'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  type('Restaurants'),
                  type('Clubs'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Discover',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              /* Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Column(
                  children: [
                    Text(
                      HomeData[0].headlines,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 100,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/covidNepal.jpeg',
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        HomeData[0].buttonText,
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                    )
                  ],
                ),
              ),*/
              Container(
                height: 170,
                width: double.infinity,
                color: Colors.white,
              ),
              Container(
                height: 170,
                width: double.infinity,
                color: Colors.white,
              ),
              Container(
                height: 170,
                width: double.infinity,
                color: Colors.white,
              )
            ],
          ),
        ));
  }

  Widget type(String name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentSelectType = name;
        });
        print(_currentSelectType);
        Navigator.pushNamed(
          context,
          '/pacakagesScreen',
        );
      },
      child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          width: 0.45 * MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/$name.svg',
                height: 55,
              ),
              SizedBox(
                width: 5,
              ),
              Text(name)
            ],
          )
          //  fit: BoxFit.fitWidth,

          ),
    );
  }
}
/*     Text(
          name,
          maxLines: 1,
          textAlign: TextAlign.center,
        ), */
