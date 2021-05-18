import 'package:flutter/material.dart';
import 'package:travel/screens/CreateTour/createTourCard.dart';
import 'package:travel/screens/homePage/components/viewDestination.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:travel/services/tours_services.dart';

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
      body: TypeAheadField<User>(
        noItemsFoundBuilder: (context) {
          return CreateTourCard();
        },
        textFieldConfiguration: TextFieldConfiguration(

            // onSubmitted: (value) {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (ctx) => ViewDestination(value)));
            // },
            decoration: InputDecoration(
                hintText: 'Search Destianiton',
                suffixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15))),
        suggestionsCallback: UserApi.getSuggestion,
        itemBuilder: (context, User suggestion) {
          final user = suggestion;

          return ListTile(
            title: Text(user.name),
          );
        },
        onSuggestionSelected: (User suggestion) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => ViewDestination(suggestion.name)));
        },
      ),
    );
  }
}
