import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("");
  sliderModel.setTitle("Book Your Trip");
  sliderModel.setImageAssetPath("assets/images/1.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("");
  sliderModel.setTitle("Share Story");
  sliderModel.setImageAssetPath("assets/images/2.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("");
  sliderModel.setTitle("Book Your Stay");
  sliderModel.setImageAssetPath("assets/images/3.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  sliderModel.setDesc("");
  sliderModel.setTitle("Scout Nearby");
  sliderModel.setImageAssetPath("assets/images/4.svg");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
