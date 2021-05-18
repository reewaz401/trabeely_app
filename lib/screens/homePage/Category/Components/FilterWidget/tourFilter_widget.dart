import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/components/SizeConfig.dart';

import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/FilterData.dart';
import 'package:travel/screens/homePage/Category/Components/AdvanceFilter/rangeSliderCustom.dart';
import 'package:travel/services/deviceSize.dart';
//import 'package:travel/screens/homePage/Category/Components/FilterWidget/filterIcon_widget.dart';

class TourFilter extends StatelessWidget {
  // var _numOfCustomer = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  // var _currentnumOfCustomer = 1;
  var selectedRange = RangeValues(0.2, 0.8);
  final GlobalKey<FormState> _formDestination = GlobalKey();
  final _tourDestination = TextEditingController();
  List<int> priceRange = [];
  @override
  Widget build(BuildContext context) {
    var destination = '';

    return Container(
      padding: EdgeInsets.only(top: 10, left: 15),
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: SizeConfig.khTextField,
                  width: SizeConfig.kwTextField,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(width: 1, color: Colors.blue[900])),
                  child: Form(
                    key: _formDestination,
                    child: TextFormField(
                      controller: _tourDestination,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          hintText: "Enter Destination",
                          hintStyle: TextStyle(color: Colors.blue[900])),
                      onSaved: (value) {
                        FilterData().setDestination(value);
                      },
                      onFieldSubmitted: (val) {
                        var provider = Provider.of<InitialSetPrice>(context,
                            listen: false);
                        Provider.of<FilterData>(context, listen: false)
                            .setDestination(_tourDestination.text);
                        Provider.of<FilterData>(context, listen: false)
                            .setPrice(provider.iniStart, provider.iniEnd);
                      },
                    ),
                  )),
              IconButton(
                  icon: Icon(
                    Icons.filter_list_outlined,
                  ),
                  onPressed: () {
                    alertBox(context: context, title: 'Advance Filter');
                  }),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  // Widget numberOfPeople() {
  //   return DropdownButton(
  //     items: _numOfCustomer.map((int dropDownItem) {
  //       return DropdownMenuItem(
  //           value: dropDownItem, child: Text(dropDownItem.toString()));
  //     }).toList(),
  //     onChanged: (newValue) {
  //       this._currentnumOfCustomer = newValue;
  //     },
  //     value: _currentnumOfCustomer,
  //   );
  // }

  // Widget button(BuildContext context) {
  //   return Container(
  //     child: TextButton(
  //       child: Text('Search'),
  //       onPressed: () async {
  //         Provider.of<FilterData>(context, listen: false)
  //             .setDestination(_tourDestination.text);
  //         Provider.of<FilterData>(context, listen: false)
  //             .setPrice(provider.iniStart, provider.iniEnd);
  //       },
  //     ),
  //   );
  // }

  Future<void> alertBox({BuildContext context, String title}) async {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              children: [
                Container(
                  width: 0.8 * MediaQuery.of(context).size.width,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Price Range",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          RangeSliderCustom(),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      var provider =
                          Provider.of<InitialSetPrice>(context, listen: false);
                      Provider.of<FilterData>(context, listen: false)
                          .setDestination(_tourDestination.text);
                      Provider.of<FilterData>(context, listen: false)
                          .setPrice(provider.iniStart, provider.iniEnd);

                      Navigator.of(context).pop();
                    },
                    child: Text('Apply'))
              ],
            ),
          );
        });
  }
}
