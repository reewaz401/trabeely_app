import 'package:flutter/material.dart';
import '../dummyData/storyFeedData.dart';
import '../widget/storyFeed_item.dart';

class StoryFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
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
                  )))
        ],
      ),
    );
  }
}
