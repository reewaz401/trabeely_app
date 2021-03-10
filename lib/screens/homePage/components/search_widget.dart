import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  //destination
  final _formKey = GlobalKey<FormState>();
  //type
  var _typePacakge = ['All', 'Tours', 'Trek', 'Hotels', 'Restaurant', 'Clubs'];
  var _currentSelectType = 'All';
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
                    Navigator.pop(context, value);
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
