import 'package:flutter/material.dart';

class GeneralImages {
  final loadingImage = Image.asset('assets/images/loading.gif');
  final noInternetImage = Image.asset('assets/images/no_internet_img.png');
  final noDataImage = Image.asset('assets/images/no_data.png');
}

mixin Images {
  static final general = GeneralImages();
}
