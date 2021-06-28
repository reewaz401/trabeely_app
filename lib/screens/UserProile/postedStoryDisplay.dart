import 'package:flutter/material.dart';
import 'package:travel/screens/storyFeedScreen/components/storyFeed_item.dart';

class PostedStoryDisplay extends StatefulWidget {
  final Map postedStory;
  PostedStoryDisplay(this.postedStory);

  @override
  _PostedStoryDisplayState createState() => _PostedStoryDisplayState();
}

class _PostedStoryDisplayState extends State<PostedStoryDisplay> {
  @override
  Widget build(BuildContext context) {
    print(widget.postedStory);
    return Scaffold(
        appBar: AppBar(),
        body: Column(
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
                          '''widget.postedStory['fullname']''',
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
            Container(
              child: Image.network(
                  'https://api.trabeely.com/uploads/story/' +
                      widget.postedStory['post_image'][0],
                  fit: BoxFit.fill, loadingBuilder: (BuildContext context,
                      Widget child, ImageChunkEvent loadingProgress) {
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
              }),
            ),
          ],
        ));
  }
}
