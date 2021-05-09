import 'package:flutter/material.dart';
import 'package:travel/components/uploadPhoto.dart';
import 'package:travel/services/accessPublicApi.dart';
import '../../dummyData/storyFeedData.dart';
import 'components/storyFeed_item.dart';

class StoryFeedScreen extends StatefulWidget {
  static const routeName = '/storyScreen';

  @override
  _StoryFeedScreenState createState() => _StoryFeedScreenState();
}

class _StoryFeedScreenState extends State<StoryFeedScreen> {
  storrySettingUp() async {
    var res =
        await getPublicDataApi('https://api.trabeely.com/api/story/getpost');

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await UploadPhoto().imagePickerDialog(context);
        },
        child: Icon(Icons.add_a_photo),
      ),
      body: Container(
        color: Colors.grey[300],
        height: MediaQuery.of(context).size.height - 130,
        width: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: storrySettingUp(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data['data'].length,
                            itemBuilder: (context, index) {
                              final data = snapshot.data['data'];
                              return Container(
                                child: StoryFeedItem(
                                  userName: data[index]['user']['fullname'],
                                  description: data[index]['post_desc'],
                                  location: 'Kathmandu',
                                  imageUrl: data[index]['post_image'],
                                ),
                              );
                            },
                          )
                        : Container(
                            child: Center(child: CircularProgressIndicator()),
                          );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
