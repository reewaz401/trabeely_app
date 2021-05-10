import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          child: Text('bob'),
          onPressed: () async {
            String url = 'https://newweb.nepalstock.com/api/nots';
            final response = await http.get(url);
            print(response.body);
          },
        ),
      ),
    );
  }
}
