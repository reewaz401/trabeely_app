import 'package:flutter/material.dart';
import 'package:travel/components/SizeConfig.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/screens/storyFeedScreen/components/comment.dart';
import 'package:travel/services/postLike.dart';

class BottomItemWidget extends StatefulWidget {
  final int numLike;
  final bool islike;
  final String postId;
  BottomItemWidget({this.islike, this.numLike, this.postId});

  @override
  _BottomItemWidgetState createState() =>
      _BottomItemWidgetState(islike, numLike);
}

class _BottomItemWidgetState extends State<BottomItemWidget> {
  bool varlike;
  int varNumLike;
  _BottomItemWidgetState(this.varlike, this.varNumLike);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$varNumLike likes'),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  button(
                      path: varlike
                          ? 'assets/images/liked.svg'
                          : 'assets/images/unlike.svg',
                      ontap: () async {
                        await PostLike()
                            .postLike(widget.postId, varlike ? false : true);
                        setState(() {
                          varlike = !varlike;
                          if (varlike) {
                            varNumLike++;
                          } else {
                            varNumLike--;
                          }
                        });
                      }),
                  SizedBox(
                    width: 10,
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
                  SizedBox(
                    width: 10,
                  ),
                  button(path: 'assets/images/Group.svg', ontap: () {}),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget button({String path, ontap}) {
    return InkWell(
        splashColor: Colors.red, // inkwell color
        child: SizedBox(
          height: SizeConfig.khcommentButton,
          width: SizeConfig.khcommentButton,
          child: SvgPicture.asset(path),
        ),
        onTap: ontap);
  }
}
