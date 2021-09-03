import 'package:flutter/material.dart';

final loadingAnimation = Image.asset('assets/images/loading.gif');

class GeneralImages {
  final loadingImage = Image.asset('assets/images/loading.gif');
  final noInternetImage = Image.asset('assets/images/no_internet_img.png');
}

mixin Images {
  static final general = GeneralImages();
}
