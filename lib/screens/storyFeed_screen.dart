import 'package:flutter/material.dart';
import 'package:travel/screens/storyFeedScreen/components/storyFeed_item.dart';
import '../dummyData/storyFeedData.dart';

class StoryFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: StoryFeedData.length,
            itemBuilder: (context, index) => Container(
              child: StoryFeedItem(
                userName: StoryFeedData[index].userName,
                description: StoryFeedData[index].description,
                imageUrl: StoryFeedData[index].imageUrl,
                location: StoryFeedData[index].location,
              ),
            ),
          )
        ],
      ),
    );
  }
}
