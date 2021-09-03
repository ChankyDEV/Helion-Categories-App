import 'package:flutter/material.dart';

class GeneralStyles {
  final headerBig = const TextStyle(
    fontSize: 28,
    color: Colors.black,
  );
  final headerSmall = const TextStyle(
    fontSize: 20,
  );
  final descriptionLabelBold = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
  );
  final body = const TextStyle(
    fontSize: 16.0,
  );
  final button = const TextStyle(
    fontSize: 16.0,
  );
  final sideNote = const TextStyle(
    fontSize: 11.0,
    fontStyle: FontStyle.italic,
  );
}

mixin Styles {
  static final general = GeneralStyles();
}
