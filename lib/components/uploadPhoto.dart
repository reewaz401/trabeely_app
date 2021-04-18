import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:travel/screens/storyFeedScreen/components/addStory_screen.dart';

class UploadPhoto {
  Future getImage(ImageSource source) async {
    File _imagePath;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    _imagePath = File(pickedFile.path);

    Image image = Image.file(_imagePath);
    return image;
  }

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
                        await getImage(ImageSource.gallery);
                      }),
                  FlatButton(
                    child: Text('Camera'),
                    onPressed: () async {
                      await getImage(ImageSource.camera);
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
