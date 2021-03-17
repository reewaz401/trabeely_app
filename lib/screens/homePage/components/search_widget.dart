import 'package:flutter/material.dart';
import 'package:travel/screens/tabsScreen/tabs_screen.dart';
import '../homePage_screen.dart';

class SearchWidget extends StatefulWidget {
  final String destination;
  SearchWidget(this.destination);
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  //destination
  final _formKey = GlobalKey<FormState>();
  //type

  final FocusNode _destinationFocusnode = FocusNode();
  @override
  void didChangeDependencies() {
    FocusScope.of(context).requestFocus(_destinationFocusnode);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(12)),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  focusNode: _destinationFocusnode,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 15, bottom: 11, top: 11, right: 15),
                      hintText: "Enter Destination",
                      hintStyle: TextStyle(color: Colors.grey[900])),
                  onFieldSubmitted: (value) {
                    _formKey.currentState.save();
                    Navigator.pushReplacementNamed(
                        context, TabsScreen.routeName,
                        arguments: SearchWidget(value));
                  },
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
