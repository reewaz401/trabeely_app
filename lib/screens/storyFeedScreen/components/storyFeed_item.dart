import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel/screens/storyFeedScreen/components/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;

class StoryFeedItem extends StatefulWidget {
  final String userName;
  final String location;
  final List imageUrl;
  final String description;
  StoryFeedItem(
      {this.userName, this.location, this.imageUrl, this.description});
  @override
  _StoryFeedItemState createState() => _StoryFeedItemState();
}

class _StoryFeedItemState extends State<StoryFeedItem> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    print(widget.imageUrl);
    var deviceSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      width: deviceSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
          SizedBox(
            height: 10,
          ),
          Text(widget.description),
          SizedBox(
            height: 10,
          ),
          widget.imageUrl.length != 0
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
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
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.blue[900],
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes
                                    : null,
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  button(
                      path: 'assets/images/Group-3.svg',
                      ontap: () {
                        print('The Story Is Like By You');
                      }),
                  button(
                      path: 'assets/images/Group-1.svg',
                      ontap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CommentBox(
                                title: "Comment",
                                descriptions:
                                    "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                                text: "Done",
                              );
                            });
                      }),
                  button(path: 'assets/images/Group.svg', ontap: () {})
                ],
              ),
            ],
          )
        ],
      ),
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
              height: 25,
              width: 25,
              child: SvgPicture.asset(path),
            ),
            onTap: ontap),
      ),
    ),
  );
}
