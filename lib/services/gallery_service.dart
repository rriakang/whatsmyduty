import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryService {
  static final ImagePicker _picker = ImagePicker();

  // 갤러리에서 이미지를 선택하는 메소드
  static Future<String?> openGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // 이미지 파일의 경로를 반환
        return image.path;
      }
    } catch (e) {
      // 오류 처리, 예를 들어 로그를 출력할 수 있습니다.
      print(e);
    }
    return null; // 선택을 취소하거나 오류가 발생한 경우
  }
}
