import 'dart:convert';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel/components/SizeConfig.dart';
import 'package:travel/screens/storyFeedScreen/bottomItem_widget.dart';
//import 'package:travel/screens/storyFeedScreen/components/LikeButton.dart';
import 'package:travel/screens/storyFeedScreen/components/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/screens/storyFeedScreen/midItem_widget.dart';
import 'package:travel/screens/storyFeedScreen/uperItem_widget.dart';
import 'package:travel/services/Api/postapi.dart';
import 'package:travel/services/postLike.dart';

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
  _StoryFeedItemState createState() => _StoryFeedItemState(numLike, isLike);
}

class _StoryFeedItemState extends State<StoryFeedItem> {
  int nLike;
  bool like;
  _StoryFeedItemState(this.nLike, this.like);

  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      //color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          color: Colors.white,
          child: UpperItemWidget(
            userName: widget.userName,
          ),
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
            ? MidItemWidget(
                imageUrl: widget.imageUrl,
              )
            : Container(),
        SizedBox(
          height: 5,
        ),
        BottomItemWidget(
          islike: widget.isLike,
          numLike: widget.numLike,
          postId: widget.postId,
        )
      ]),
    );
  }
}

Widget button({String path, ontap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
        splashColor: Colors.red, // inkwell color
        child: SizedBox(
          height: SizeConfig.khcommentButton,
          width: SizeConfig.khcommentButton,
          child: SvgPicture.asset(path),
        ),
        onTap: ontap),
  );
}
