import 'package:flutter/material.dart';
import 'package:travel/components/uploadPhoto.dart';
import 'package:travel/screens/storyFeedScreen/components/addStory_screen.dart';
import 'package:travel/screens/storyFeedScreen/components/postStory.dart';
import '../../dummyData/storyFeedData.dart';
import 'components/storyFeed_item.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class StoryFeedScreen extends StatefulWidget {
  static const routeName = '/storyScreen';

  @override
  _StoryFeedScreenState createState() => _StoryFeedScreenState();
}

class _StoryFeedScreenState extends State<StoryFeedScreen> {
  var _isloading = false;
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          var userToken = prefs.getString('userToken');
          if (userToken == null) {
            return;
          }
          setState(() {
            _isloading = true;
          });

          await loadAssets();

          if (images.isEmpty) {
            setState(() {
              _isloading = false;
            });
            return;
          }
          setState(() {
            _isloading = false;
          });
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => AddStoryScreen(
                    images: images,
                  )));

          //UploadPhoto().imagePickerDialog(context);
        },
        child: Icon(Icons.add_a_photo),
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.grey[300],
              height: MediaQuery.of(context).size.height - 130,
              width: MediaQuery.of(context).size.height,
              child: Column(
                children: [
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
            ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }
}
