import 'dart:io';
import 'package:flutter/material.dart';
import 'package:travel/components/button.dart';
import 'package:travel/controller/postStory.dart';

import 'package:multi_image_picker/multi_image_picker.dart';
//import 'package:travel/screens/storyFeed_screen.dart';

class AddStoryScreen extends StatefulWidget {
  final List<Asset> images;
  final File imageFile;
  AddStoryScreen({this.imageFile, this.images});
  @override
  _AddStoryScreenState createState() => _AddStoryScreenState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

class _AddStoryScreenState extends State<AddStoryScreen> {
  TextEditingController _captionController = TextEditingController();
  Map<String, Object> userPostInfo = {'location': '', 'desc': ''};

  var _isloading = false;
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('New Story'),
        centerTitle: true,
        actions: [
          FlatButton(
            child: Text(
              'Post',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              setState(() {
                _isloading = true;
              });

              await postStory();
              // Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (ctx) => StoryFeedScreen()));

              setState(() {
                _isloading = false;
              });
              //  Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: !_isloading
          ? SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      node.unfocus();
                    },
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      // SizedBox(
                      //     height: 150,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: buildGridView()),
                      buildImageView(),
                      SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Location',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                  // border: InputBorder.none,
                                  // focusedBorder: InputBorder.none,
                                  // enabledBorder: InputBorder.none,
                                  // errorBorder: InputBorder.none,
                                  // // disabledBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.only(bottom: 12, right: 15),
                                  hintText: 'kathmandu',
                                ),
                                onSaved: (value) {
                                  userPostInfo['location'] = value;
                                  userPostInfo['desc'] = userPostInfo['desc'];
                                },
                                onEditingComplete: () => node.nextFocus()),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'Give short description',
                              ),
                              onSaved: (value) {
                                userPostInfo['location'] =
                                    userPostInfo['location'];
                                userPostInfo['desc'] = value;
                              },
                              onFieldSubmitted: (_) => node.unfocus(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Button(
                          text: 'Post',
                          callback: () async {
                            _formKey.currentState.save();
                            setState(() {
                              _isloading = true;
                            });
                            await postStory();
                            // Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(
                            //         builder: (ctx) => StoryFeedScreen()));

                            setState(() {
                              _isloading = false;
                            });
                          }),
                    ]),
                  )),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget buildImageView() {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            Asset asset = widget.images[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              ),
            );
          }),
    );
  }

  Future<void> postStory() async {
      await PostStory()
        .postStory(imageAsset: widget.images, userPostInfo: userPostInfo);
    Navigator.of(context).pop();
  }
}
