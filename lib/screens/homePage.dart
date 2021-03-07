import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/widget/search_widget.dart';
import '../dummyData/homeData.dart';
import './search_screen.dart';
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
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: paddingSize,
              ),
              GestureDetector(
                onTap: () async {
                  print(MediaQuery.of(context).size.width);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchWidget())).then((result) {
                    setState(() {
                      finaldestination = result;
                    });
                    print(finaldestination);
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
                  margin: EdgeInsets.all(8),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      border: Border.all(width: 2, color: Colors.green)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$finaldestination',
                          style:
                              TextStyle(fontSize: 17, color: Colors.grey[600])),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'tours,pacakges,hotels,restaurant...',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [type('All'), type('Tours'), type('Hotels')],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [type('Restaurant'), type('Clubs'), type('Any')],
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
              Container(
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
        padding: EdgeInsets.all(20),
        width: 0.31 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(width: 0.5),
              right: BorderSide(width: 0.5),
              bottom: BorderSide(
                  width: name == _currentSelectType ? 3 : 0.5,
                  color: name == _currentSelectType
                      ? Colors.orange[900]
                      : Colors.black)),
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

//old design
/*Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 0.31 * deviceSize.width,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(width: 0.5, color: Colors.grey),
                              bottom:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                      child: FlatButton(
                        child: Text('Tours'),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 0.31 * deviceSize.width,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(width: 0.5, color: Colors.grey),
                              bottom:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                      child: FlatButton(
                        child: Text('Hotels'),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 0.31 * deviceSize.width,
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(width: 0.5, color: Colors.grey),
                              bottom:
                                  BorderSide(width: 0.5, color: Colors.grey),
                              right:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                      child: FlatButton(
                        child: Text('Restaurant'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                
                  height: 50,
                  width: 0.9 * deviceSize.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Destination"),
                  )),*/
/*Container(
                height: 70,
                width: deviceSize.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 60,
                      child: FlatButton(
                        onPressed: null,
                        child: SvgPicture.asset('assets/images/trek.svg'),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      child: FlatButton(
                          onPressed: null,
                          child: SvgPicture.asset('assets/images/hotel.svg')),
                    ),
                    SizedBox(
                      width: 60,
                      child: FlatButton(
                          onPressed: null,
                          child:
                              SvgPicture.asset('assets/images/restaurant.svg')),
                    ),
                  ],
                ),
              ),*/
