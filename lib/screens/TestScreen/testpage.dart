// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:travel/screens/storyFeedScreen/components/storyFeed_item.dart';
// import 'package:travel/services/Api/getApi.dart';

// class TestPage extends StatefulWidget {
//   static const routeName = '/storyScreen';

//   @override
//   _TestPageState createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   int page = 1;
//   ScrollController _sc = new ScrollController();
//   bool isLoading = false;
//   List story = [];
//   final dio = new Dio();
//   @override
//   void initState() {
//     this._getMoreData(page);
//     super.initState();
//     _sc.addListener(() {
//       if (_sc.position.pixels == _sc.position.maxScrollExtent) {
//         _getMoreData(page);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _sc.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//           color: Colors.grey[300],
//           height: MediaQuery.of(context).size.height - 130,
//           width: MediaQuery.of(context).size.height,
//           child: ListView.builder(
//             itemCount:
//                 story.length + 1, // Add one more item for progress indicator
//             padding: EdgeInsets.symmetric(vertical: 8.0),
//             itemBuilder: (BuildContext context, int index) {
//               if (index == story.length) {
//                 return _buildProgressIndicator();
//               } else {
//                 return StoryFeedItem(
//                   description: 'asd',
//                   id: 'asd',
//                   userName: 'asd',
//                   location: 'asd ',
//                   like: [],
//                   imageUrl: [],
//                 );
//               }
//             },
//             controller: _sc,
//           )),
//     );
//   }

//   void _getMoreData(int index) async {
//     if (!isLoading) {
//       setState(() {
//         isLoading = true;
//       });
//       var url = "https://api.trabeely.com/api/story/getpost/$page";
//       print(url);
//       final response = await getApiData(url);
//       // print(response['data'][1]);
//       List tList = [];
//       if (response['data'].length == 0) {
//         print("End");
//       } else {
//         for (int i = 0; i < response['data'].length; i++) {
//           tList.add(response['data'][i]);
//         }
//       }

//       setState(() {
//         isLoading = false;
//         story.addAll(tList);
//         page++;
//       });
//     }
//   }

//   Widget _buildProgressIndicator() {
//     return new Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: new Center(
//         child: new Opacity(
//           opacity: isLoading ? 1.0 : 00,
//           child: new CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
