import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:travel/screens/storyFeedScreen/components/addStory_screen.dart';

class UploadPhoto {
  File imageTaken;
  Future<File> imagePickerDialog(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('Choose Method'),
            content: Text('Please choose the source of your image'),
            actions: [
              Column(
                children: [
                  FlatButton(
                      child: Text('Library'),
                      onPressed: () async {
                        imageTaken = await imageSource('Library', ctx);
                        Navigator.of(context).pop(imageTaken);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => AddStoryScreen(imageTaken)));
                      }),
                  FlatButton(
                    child: Text('Camera'),
                    onPressed: () async {
                      imageTaken = await imageSource('Camera', ctx);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => AddStoryScreen(imageTaken)));
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

    final appDir = await syspaths
        .getApplicationDocumentsDirectory(); //findnig app directory to store data
    final fileName = path.basename(fileImage.path);
    final savedImage = await fileImage.copy('${appDir.path}/$fileName');
    return fileImage;
  }
}
