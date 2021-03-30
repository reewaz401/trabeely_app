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
                  color: Color(0xFF4579B2).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10)),
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
                      hintStyle: TextStyle(color: Colors.white)),
                  onFieldSubmitted: (value) {
                    _formKey.currentState.save();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => TabsScreen(value)));
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
