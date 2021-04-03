import 'dart:io';
import 'package:flutter/material.dart';

class AddStoryScreen extends StatefulWidget {
  final File imageFile;
  AddStoryScreen(this.imageFile);
  @override
  _AddStoryScreenState createState() => _AddStoryScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

class _AddStoryScreenState extends State<AddStoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FlatButton(
            child: Text(
              'Post',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              // Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(25)),
            child: Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 12, right: 15),
                  hintText: 'Give short description',
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: 0.4 * MediaQuery.of(context).size.width / 1.25,
                  width: 0.4 * MediaQuery.of(context).size.width,
                  child: widget.imageFile == null
                      ? Container()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.file(
                            widget.imageFile,
                            fit: BoxFit.fill,
                          ),
                        )),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[200],
                ),
                height: 0.4 * MediaQuery.of(context).size.width / 1.25,
                width: 0.4 * MediaQuery.of(context).size.width,
                child: Icon(
                  Icons.add,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
