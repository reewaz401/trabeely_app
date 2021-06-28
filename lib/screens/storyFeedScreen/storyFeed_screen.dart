import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel/components/uploadPhoto.dart';
import 'package:travel/services/Api/getApi.dart';
import 'package:travel/services/accessPublicApi.dart';
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
  int page = 1;
  bool _show = true;
  String _error = 'No Error Dectected';
  bool _isloading = false;
  List<Asset> images = <Asset>[];
  ScrollController _sc = new ScrollController();
  bool isLoading = false;
  List story = [];
  final dio = new Dio();
  @override
  void initState() {
    this._getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _show,
        child: FloatingActionButton(
          onPressed: () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
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
      ),
      body: Container(
          color: Colors.grey[300],
          //height: 200,
          //  width: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount:
                story.length + 1, // Add one more item for progress indicator
            padding: EdgeInsets.symmetric(vertical: 8.0),
            itemBuilder: (BuildContext context, int index) {
              print(story);
              if (index == story.length) {
                return _buildProgressIndicator();
              } else {
                final num = story[index]['likes'].length;
                final like = story[index]['likes'].length > 0 ? true : false;
                return Card(
                  margin: EdgeInsets.all(5),
                  child: StoryFeedItem(
                    description: story[index]['post_desc'],
                    id: story[index]['_id'],
                    userName: story[index]['user']['fullname'],
                    location: story[index]['post_location'],
                    postId: story[index]['_id'],
                    isLike: like,
                    numLike: num,
                    imageUrl: story[index]['post_image'],
                  ),
                );
              }
            },
            controller: _sc,
          )),
    );
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var url = "https://api.trabeely.com/api/story/getpost/$page";
      print(url);
      final response = await getApiData(url);
      // print(response['data'][1]);
      List tList = [];
      if (response['data'].length == 0) {
        print("End");
      } else {
        for (int i = 0; i < response['data'].length; i++) {
          tList.add(response['data'][i]);
        }
      }

      setState(() {
        isLoading = false;
        story.addAll(tList);
        page++;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
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
