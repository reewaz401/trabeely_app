import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/services/Api/postapi.dart';
import 'package:travel/services/Api/getApi.dart';
import 'package:travel/services/accessPublicApi.dart';

class CommentBox extends StatefulWidget {
  final String postId;
  CommentBox({this.postId});

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  TextEditingController comment = TextEditingController();
  List story = [];
  commentsetting() async {
    var response = await postApi(
      'https://api.trabeely.com/api/story/user-comment',
      json.encode(
        {
          "storyId": "60a4f607721abc66f52a2ba3",
          "userId": "60606ba830da000c9436cb13"
        },
      ),
    );

    return response;
  }

  @override
  void initState() {
    print('Loading');
    commentsetting().then((value) {
      setState(() {
        story = value;
        print(story[0]['comment']);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _scaffold;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 45, right: 20, bottom: 20),
            margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 10),
                      blurRadius: 10),
                ]),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 350,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: story.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 3.0, top: 8, bottom: 8),
                                    child: CircleAvatar(
                                      maxRadius: 15,
                                      backgroundColor: Colors.grey,
                                    ),
                                  ),
                                  Container(
                                    color: Colors.grey[300],
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.60,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              story[index]['user']['fullname'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Text(story[index]['comment']),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );
                        }),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 45,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                  child: Text('Profile Pic')),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.69,
                        child: TextField(
                          onChanged: (c) {
                            setState(() {});
                          },
                          controller: comment,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter You Comment'),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: SizedBox(
                          height: 50,
                          child: comment.text.length != 0
                              ? IconButton(
                                  color: Colors.blue[900],
                                  onPressed: () async {
                                    if (comment.text.length == 0) {
                                      print('empty');
                                    } else {
                                      await postApi(
                                        'https://api.trabeely.com/api/story/comment',
                                        json.encode(
                                          {
                                            "storyId": widget.postId,
                                            "userId":
                                                "604ece1abfbaac3c7c5a9630",
                                            "comment": comment.text
                                          },
                                        ),
                                      );
                                    }
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.send),
                                )
                              : Container(),
                        ),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
