import 'package:flutter/material.dart';
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
          addStoryBox(context),
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

  Widget addStoryBox(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final image = await UploadPhoto().imagePickerDialog(context);
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
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: null,
                ),
              )
            ],
          ),
          color: Colors.white),
    );
  }
}
