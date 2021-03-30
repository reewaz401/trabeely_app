import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'package:travel/screens/storyFeedScreen/components/addStory_screen.dart';
import '../../dummyData/storyFeedData.dart';
import 'components/storyFeed_item.dart';
import '../../components/uploadPhoto.dart';

class StoryFeedScreen extends StatelessWidget {
  static const routeName = '/storyScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.height - 130,
      width: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          addStoryCard(context),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: StoryFeedData.length,
                itemBuilder: (context, index) => Container(
                        child: StoryFeedItem(
                      userName: StoryFeedData[index].userName,
                      description: StoryFeedData[index].description,
                      imageUrl: StoryFeedData[index].imageUrl,
                      location: StoryFeedData[index].location,
                    ))),
          )
        ],
      ),
    );
  }

  Widget addStoryCard(BuildContext context) {
    return Container(
      // color: Colors.blueAccent,
      height: 60,
      child: InkWell(
        onTap: () async {
          final image = await UploadPhoto().imagePickerDialog(context);
        },
        child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
          // Those are our background
          Container(
            height: 136,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 15),
                    blurRadius: 27,
                    color: Colors.black12, // Black color with 12% opacity
                  )
                ]),
          ),
        ]),
      ),
    );
  }

  Widget addStoryBox(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final image = await UploadPhoto().imagePickerDialog(context);
        if (image == null) {
          return;
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (ctx) => AddStoryScreen(image)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Add your story',
              style: TextStyle(fontSize: 18),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 0, bottom: 5),
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 0.7 * MediaQuery.of(context).size.width,
                    //color: Colors.red,
                    child: Text(
                      'Add your story',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.orange,
                        size: 40,
                      ),
                      onPressed: null,
                    ),
                  )
                ],
              ),
            ),

            // our product image

            // Product title and price
          ],
        ),
      ),
    );
  }
}
