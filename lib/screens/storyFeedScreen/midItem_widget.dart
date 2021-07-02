import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:travel/components/SizeConfig.dart';

class MidItemWidget extends StatelessWidget {
  //const MidItemWidget({ Key? key }) : super(key: key);
  final List imageUrl;
  MidItemWidget({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: SizeConfig.khstoryImage,
        child: Carousel(
            borderRadius: true,
            dotColor: Colors.blue[900],
            dotBgColor: Colors.transparent,
            dotSize: 5,
            autoplay: false,
            images: [
              for (int index = 0; index < imageUrl.length; index++)
                Image.network(
                    'https://api.trabeely.com/uploads/story/' + imageUrl[index],
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
                })
            ]));
  }
}
