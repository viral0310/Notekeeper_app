import 'dart:math';

import 'package:flutter/material.dart';

class Notes {
  int? id;
  String title;
  String details;
  Color? color = Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
      Random().nextInt(256), Random().nextInt(256));

  Notes({this.id, required this.details, required this.title, this.color});
}
