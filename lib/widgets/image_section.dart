// image_section.dart
import 'package:flutter/material.dart';
import 'dart:io';

class ImageSection extends StatelessWidget {
  final String? imagePath;

  const ImageSection({Key? key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imagePath == null
        ? Text("사진을 선택해주세요.")
        : Image.file(File(imagePath!));
  }
}
