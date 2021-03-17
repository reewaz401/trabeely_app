import 'dart:io';
import 'package:flutter/material.dart';

class AddStoryScreen extends StatefulWidget {
  final File imageFile;
  AddStoryScreen(this.imageFile);
  @override
  _AddStoryScreenState createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Image.file(widget.imageFile)),
    );
  }
}
