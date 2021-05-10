import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel/components/uploadPhoto.dart';
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
  storrySettingUp() async {
    var res =
        await getPublicDataApi('https://api.trabeely.com/api/story/getpost');

    return res;
  }

  var _isloading = false;
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';
  ScrollController _scrollController =
      new ScrollController(); // set controller on scrolling
  bool _show = true;
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    addItemsToTheList();
    handleScroll();
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  void showFloationButton() {
    setState(() {
      _show = true;
    });
  }

  void hideFloationButton() {
    setState(() {
      _show = false;
    });
  }

  void addItemsToTheList() {
    for (int count = 1; count <= 100; count++) {
      items.add("Book " + count.toString());
    }
  }

  void handleScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        hideFloationButton();
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        showFloationButton();
      }
    });
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
                            controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data['data'].length,
                            itemBuilder: (context, index) {
                              final data = snapshot.data['data'];
                              return Card(
                                child: Container(
                                  child: StoryFeedItem(
                                    userName: data[index]['user']['fullname'],
                                    description: data[index]['post_desc'],
                                    location: 'Kathmandu',
                                    imageUrl: data[index]['post_image'],
                                  ),
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
