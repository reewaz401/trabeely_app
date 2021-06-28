import 'package:flutter/material.dart';
import 'package:travel/screens/storyFeedScreen/components/storyFeed_item.dart';
import './postedStoryDisplay.dart';

Widget myStoryView(Map postedStory) {
  return postedStory == null || postedStory.isEmpty
      ? Container(
          child: Center(
            child: Text('Could not find story'),
          ),
        )
      : Container(
          child: GridView.builder(
            cacheExtent: 1000,
            itemCount: postedStory['data'].length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return InkResponse(
                onTap: () {
                  final story = postedStory['data'];
                  return Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryFeedItem(
                          description: story[index]['post_desc'],
                          id: story[index]['_id'],
                          userName: story[index]['user']['fullname'],
                          location: story[index]['post_location'],
                          postId: story[index]['_id'],
                          isLike: true,
                          imageUrl: story[index]['post_image'],
                        ),
                      ));
                },
                child: Image.network(
                    'https://api.trabeely.com/uploads/story/' +
                        postedStory['data'][index]['post_image'][0],
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
              );
            },
          ),
        );
}
