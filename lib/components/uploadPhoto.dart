import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:travel/screens/storyFeedScreen/components/addStory_screen.dart';

class UploadPhoto {
  void getImage(BuildContext ctx, ImageSource source) async {
    File _imagePath;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    _imagePath = File(pickedFile.path);

    // Image image = Image.file(_imagePath);
    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (ctx) => AddStoryScreen(
              imageFile: _imagePath,
            )));
  }

  File imageTaken;
  Future<File> imagePickerDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Upload Travel Photo'),
            content: Text('Please choose the source of your image'),
            actions: [
              Column(
                children: [
                  FlatButton(
                      child: Text('Library'),
                      onPressed: () async {
                        getImage(context, ImageSource.gallery);
                      }),
                  FlatButton(
                    child: Text('Camera'),
                    onPressed: () async {
                      getImage(context, ImageSource.camera);
                    },
                  )
                ],
              )
            ],
          );
        });
  }

  Future<File> imageSource(String type, BuildContext ctx) async {
    final imageFile = await ImagePicker().getImage(
        source: type == 'Library' ? ImageSource.gallery : ImageSource.camera,
        maxWidth: 0.7 * MediaQuery.of(ctx).size.width);
    if (imageFile == null) {
      return null;
    }
    final fileImage = File(imageFile.path);

    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (ctx) => AddStoryScreen(
              imageFile: fileImage,
            )));
    return fileImage;
  }
}
