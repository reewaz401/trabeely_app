import 'package:flutter/material.dart';
import '../../dummyData/storyFeedData.dart';
import 'components/storyFeed_item.dart';

class StoryFeedScreen extends StatelessWidget {
  static const routeName = '/storyScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          addStoryBox(context),
          ListView.builder(
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

  Widget addStoryBox(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Card(
              margin: EdgeInsets.only(left: 35, top: 25),
              child: Row(
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
              )),
          color: Colors.white),
    );
  }
}
