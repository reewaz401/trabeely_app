import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel/dummyData/hotelData.dart';
import 'package:travel/model/toursForm.dart';
import 'package:travel/services/tours_services.dart';
import '../filterWidget/filter.dart';
import './homePage/Category/Components/tour_item.dart';
import '../widget/hotels_item.dart';
import '../dummyData/trekData.dart';
import './homePage/Category/Components/DetailsScreen/tourPackDetails_screen.dart';
import 'package:provider/provider.dart';
import '../animation/animationButton.dart';

class PacakagesScreen extends StatefulWidget {
  static const routeName = '/pacakagesScreen';

  @override
  _PacakagesScreenState createState() => _PacakagesScreenState();
}

class _PacakagesScreenState extends State<PacakagesScreen> {
  String firstType;
  @override
  void initState() {
    super.initState();
  }

  var _typePacakage = [
    'ALL',
    'Tours',
    'Hotels',
    'Treks',
    'Restaurant',
    'Clubs'
  ];
  var _currentTypePacakage = "Tours";
  var _numOfCustomer = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  var _currentnumOfCustomer = 1;
  var _isloading = true;
  //TourFilter
  var destination = '';
  final _tourDestination = TextEditingController();
//HotelFilter
  ScaffoldFeatureController _bottomSheet;
  var adultsNum = 1;
  var childNum = 0;
  var roomsNum = 1;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    var paddingSize = MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.grey[200],
        height: deviceSize.height,
        width: deviceSize.width,
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: _currentTypePacakage == 'Tours'
                      ? BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2, color: Colors.blue[900])),
                        )
                      : null,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _currentTypePacakage = 'Tours';
                      });
                    },
                    child: Text('Tours'),
                  ),
                ),
                Container(
                  decoration: _currentTypePacakage == 'Hotels'
                      ? BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2, color: Colors.blue[900])),
                        )
                      : null,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _currentTypePacakage = 'Hotels';
                      });
                    },
                    child: Text('Hotels'),
                  ),
                ),
                Container(
                  decoration: _currentTypePacakage == 'Restaurant'
                      ? BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 2, color: Colors.blue[900])),
                        )
                      : null,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        _currentTypePacakage = 'Restaurant';
                      });
                    },
                    child: Text('Restaurant'),
                  ),
                )
                /* Text('Showing Results : '),
                      DropdownButton(
                        items: _typePacakage.map((String dropDownItem) {
                          return DropdownMenuItem(
                              value: dropDownItem, child: Text(dropDownItem));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            this._currentTypePacakage = newValue;
                          });
                        },
                        value: _currentTypePacakage,
                      ),*/
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                _currentTypePacakage == 'Restaurant'
                    ? restaurantFilter()
                    : _currentTypePacakage == 'Tours'
                        ? FilterBox().tourFilter(context, _tourDestination)
                        : hotelFilter(),
                SizedBox(
                  height: 30,
                ),
                searchButton(_currentTypePacakage),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 400,
            child: allresults(destination),
          )
        ]),
      )),
    );
  }

  Widget allresults([String destination]) {
    return FutureBuilder(
      future: _currentTypePacakage == 'Tours'
          ? ToursServices().fetchPacakgeList(destination)
          : _currentTypePacakage == 'Hotels'
              ? fetchMethod('Hotels')
              : fetchMethod('Restaurants'),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : snapshot.hasData
                ? ListView.builder(
                    itemCount: 3,
                    itemBuilder: (ctx, index) {
                      var extData = snapshot.data['packages'][index];
                      return TourItem(
                        agencyName: extData['destination'],
                        date: '2021-08-02 15:30',
                        destination: 'sdsdsds',
                        price: 78,
                      );
                    })
                : Center(
                    child: Text('No data found',
                        style: TextStyle(color: Colors.grey)));
      },
    );
  }

//SearchFunction
  Future<void> fetchMethod(String type, [String destination]) async {
    if (type == 'Tours') {
      return ToursServices().fetchPacakgeList(destination);
    } else if (type == 'Hotels') {
      // return To().fetchHotelList();
    } else {
      // return ViewServices().fetchRestaurantList();
    }
  }

//Restaurant
  Widget restaurantFilter() {
    return Container(
        height: 50,
        width: 0.9 * MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
        child: TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.black)),
        ));
  }

  //Trek

  //Hotels
  Widget hotelFilter() {
    return Column(
      children: [
        Container(
            height: 50,
            width: 0.9 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Enter Destination",
                  hintStyle: TextStyle(color: Colors.black)),
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(
            left: 13,
            right: 13,
            top: 5,
          ),
          child: Row(
            children: [
              Flexible(flex: 1, child: datePicker('from')),
              VerticalDivider(),
              Flexible(flex: 1, child: datePicker('to')),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (bctx) {
                  return addRoomPeople();
                });
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 50,
            width: 0.9 * MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Text('Adults  '),
                Text(adultsNum.toString() + " ,"),
                Text(' Child '),
                Text(childNum.toString() + ' ,'),
                Text(' Rooms '),
                Text(roomsNum.toString())
              ],
            ),
          ),
        )
      ],
    );
  }

//DatePicker
  Widget datePicker([String type]) {
    return DateTimePicker(
      cursorColor: Colors.grey,
      type: DateTimePickerType.date,
      dateMask: 'yyyy, MMM d',
      initialValue: DateTime.now().toString(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 2),
      icon: Icon(
        Icons.event,
        color: Colors.green,
      ),
      dateLabelText: type == 'from'
          ? 'From'
          : type == 'to'
              ? 'To'
              : 'Date',
    );
  }

  //NumberOFPeople
  Widget numberOfPeople() {
    return DropdownButton(
      items: _numOfCustomer.map((int dropDownItem) {
        return DropdownMenuItem(
            value: dropDownItem, child: Text(dropDownItem.toString()));
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          this._currentnumOfCustomer = newValue;
        });
      },
      value: _currentnumOfCustomer,
    );
  }

//SearchButton
  Widget searchButton(String type) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () async {
          print('ok $_tourDestination');

          /*setState(() {
            _isloading = true;
          });*/
          try {
            setState(() {
              _currentTypePacakage == 'Tours'
                  ? destination = _tourDestination.text.toLowerCase()
                  : destination = null;
            });
          } catch (error) {
            print(error);
          }
          setState(() {
            _isloading = false;
          });
        },
        child: Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue[900],
      ),
    );
  }

//addRoomPeople
  Widget addRoomPeople() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter modelSetState) {
      return Container(
        margin: EdgeInsets.all(5),
        height: 0.35 * MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Adults',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                            child: Icon(
                              Icons.remove,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                modelSetState(() {
                                  adultsNum <= 1 ? adultsNum = 1 : adultsNum--;
                                });
                              });
                            }),
                        Text(
                          adultsNum.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        FlatButton(
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              adultsNum > 15
                                  ? adultsNum = adultsNum
                                  : adultsNum++;
                            });
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Children',
                    style: TextStyle(fontSize: 16),
                  ),
                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                          child: Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              childNum <= 0 ? childNum = 0 : childNum--;
                            });
                          }),
                        ),
                        Text(
                          childNum.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        FlatButton(
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              childNum > 5 ? childNum = childNum : childNum++;
                              /*childNum <= -1
                                  ? childNum = 0
                                  : childNum > 5
                                      ? childNum = childNum
                                      : childNum++;*/
                            });
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rooms',
                    style: TextStyle(fontSize: 17),
                  ),
                  Container(
                    child: Row(
                      children: [
                        FlatButton(
                          child: Icon(
                            Icons.remove,
                            color: Colors.red,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              roomsNum <= 1 ? roomsNum = 1 : roomsNum--;
                            });
                          }),
                        ),
                        Text(
                          roomsNum.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        FlatButton(
                          child: Icon(
                            Icons.add,
                            color: Colors.green,
                          ),
                          onPressed: () => setState(() {
                            modelSetState(() {
                              roomsNum > 8 ? roomsNum = roomsNum : roomsNum++;
                            });
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 60,
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                onPressed: () {},
                color: Colors.blue[900],
                child: Text(
                  'Apply',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

/* Widget tourFilter() {
    return Column(
      children: [
        Container(
            height: 50,
            width: 0.9 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              controller: _tourDestination,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InWputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Enter Destination",
                  hintStyle: TextStyle(color: Colors.black)),
            )),
        Padding(
          padding: const EdgeInsets.only(
            left: 13,
            right: 13,
            top: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: datePicker(),
                width: 0.5 * MediaQuery.of(context).size.width,
              ),
              Spacer(
                flex: 2,
              ),
              SizedBox(
                child: Text('Number of People'),
                width: 65,
              ),
              Spacer(
                flex: 1,
              ),
              numberOfPeople()
            ],
          ),
        ),
      ],
    );
  }
*/
