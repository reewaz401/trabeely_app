import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:travel/screens/Booking/bookinginfoDisplay.dart';
import 'package:travel/services/themeData.dart';

class StoryFeedItem extends StatefulWidget {
  final String userName;
  final String location;
  final String imageUrl;
  final String description;
  StoryFeedItem(
      {this.userName, this.location, this.imageUrl, this.description});
  @override
  _StoryFeedItemState createState() => _StoryFeedItemState();
}

class _StoryFeedItemState extends State<StoryFeedItem> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      //margin: EdgeInsets.only(top: 10),
      width: deviceSize.width,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: light.textTheme.headline1,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.description,
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 250,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  Container(
                    height: 250,
                    child: Center(
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.imageUrl,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      button('assets/images/like.svg'),
                      button('assets/images/Group-1.svg'),
                      button('assets/images/Group.svg')
                    ],
                  ),
                  Row(
                    children: [
                      button('assets/images/Vector.svg'),
                      button('assets/images/Group-2.svg')
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget button(String path) {
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
            child: SvgPicture.asset(path),
          ),
          onTap: () {},
        ),
      ),
    ),
  );
}
