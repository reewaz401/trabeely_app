import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel/services/postLike.dart';

class LikeButton extends StatefulWidget {
  final String postId;
  final bool islike;
  LikeButton({this.postId, this.islike});
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool userLiked;
  @override
  void initState() {
    userLiked = widget.islike;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(userLiked);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: Material(
          // button color
          child: InkWell(
              splashColor: Colors.red, // inkwell color
              child: SizedBox(
                height: 25,
                width: 25,
                child: userLiked
                    ? Container()
                    : SvgPicture.asset('assets/images/Group-3.svg'),
              ),
              onTap: () async {
                await PostLike()
                    .postLike(widget.postId, userLiked ? false : true);
                if (userLiked) {
                  setState(() {
                    userLiked = false;
                  });
                } else if (!userLiked) {
                  setState(() {
                    userLiked = true;
                  });
                }
              }),
        ),
      ),
    );
  }
}
