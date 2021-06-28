import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel/components/SizeConfig.dart';
import 'package:travel/screens/storyFeedScreen/components/LikeButton.dart';
import 'package:travel/screens/storyFeedScreen/components/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/services/Api/postapi.dart';

class StoryFeedItem extends StatefulWidget {
  final String userName;
  final String location;
  final List imageUrl;
  final String id;
  final String description;
  final String postId;
  final bool isLike;
  final int numLike;
  StoryFeedItem(
      {this.userName,
      this.location,
      this.imageUrl,
      this.id,
      this.description,
      this.postId,
      this.isLike,
      this.numLike});
  @override
  _StoryFeedItemState createState() => _StoryFeedItemState(numLike);
}

class _StoryFeedItemState extends State<StoryFeedItem> {
  int nLike;
  _StoryFeedItemState(this.nLike);

  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  PopupMenuButton(
                      child: button(path: 'assets/images/Group-2.svg'),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'Detail',
                              child: Text('View Detail'),
                            ),
                            PopupMenuItem(
                              value: 'Save',
                              child: Text('Save Image'),
                            ),
                          ]),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        widget.description == null
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.description),
                ),
              )
            : Container(),
        SizedBox(
          height: 10,
        ),
        widget.imageUrl.length != 0
            ? SizedBox(
                height: SizeConfig.khstoryImage,
                child: Carousel(
                    borderRadius: true,
                    dotColor: Colors.blue[900],
                    dotBgColor: Colors.transparent,
                    dotSize: 5,
                    autoplay: false,
                    images: [
                      for (int index = 0;
                          index < widget.imageUrl.length;
                          index++)
                        Image.network(
                            'https://api.trabeely.com/uploads/story/' +
                                widget.imageUrl[index],
                            fit: BoxFit.fill, loadingBuilder:
                                (BuildContext context, Widget child,
                                    ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.blue[900],
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        })
                    ]))
            : Container(),
        SizedBox(
          height: 5,
        ),
        Text('${widget.numLike} Likes'),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                LikeButton( 
                  postId: widget.postId,
                  islike: widget.isLike,
                ),
                button(
                    path: 'assets/images/Group-1.svg',
                    ontap: () {

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CommentBox(
                              postId: widget.postId,
                            );
                          });
                    }),
                button(path: 'assets/images/Group.svg', ontap: () {}),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ]),
    );
  }
}

Widget button({String path, ontap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipOval(
      child: Material(
        // button color
        child: InkWell(
            splashColor: Colors.red, // inkwell color
            child: SizedBox(
              height: SizeConfig.khcommentButton,
              width: SizeConfig.khcommentButton,
              child: SvgPicture.asset(path),
            ),
            onTap: ontap),
      ),
    ),
  );
}
