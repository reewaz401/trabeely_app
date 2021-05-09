import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'dart:io';

class PostStory {
  Future<void> postStory(
      {Map<String, Object> userPostInfo,
      File image,
      List<Asset> imageAsset}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userId = prefs.getString('id');
    final String userToken = prefs.getString('userToken');
    print('dasddsadas');
    print(userId);

    //=====
    var uri = Uri.parse('https://api.trabeely.com/api/story/dopost');

    var request = new http.MultipartRequest("POST", uri);
    request.headers['authorization'] = 'Bearer $userToken';
    request.fields["post_desc"] = userPostInfo['desc'];
    request.fields["post_caption"] = '';
    request.fields["userId"] = userId;
    request.fields["event"] = 'story';
    request.fields["post_location"] = userPostInfo['location'];

    for (int i = 0; i < imageAsset.length; i++) {
      var pic =
          await FlutterAbsolutePath.getAbsolutePath(imageAsset[i].identifier);
      var picPath = await http.MultipartFile.fromPath('picture', pic);
      request.files.add(picPath);
    }

    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }
}
