import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:myduty/widgets/camera_screen.dart'; // 정확한 경로로 수정해주세요.

class CameraService {
  static Future<void> openCamera(BuildContext context) async {
    var permissionStatus = await Permission.camera.status;

    // 권한이 처음부터 거부되어 있지 않은 경우에만 요청
    if (!permissionStatus.isGranted && !permissionStatus.isPermanentlyDenied) {
      permissionStatus = await Permission.camera.request();
    }

    if (permissionStatus.isGranted) {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        final firstCamera = cameras.first;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CameraScreen(camera: firstCamera)),
        );
      } else {
        print("No available cameras");
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      // 권한이 영구적으로 거부된 경우, 사용자를 설정 페이지로 유도
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('카메라 권한 필요'),
          content: Text('이 기능을 사용하기 위해 카메라 권한이 필요합니다. 설정에서 권한을 허용해주세요.'),
          actions: <Widget>[
            TextButton(
              child: Text('설정으로 이동'),
              onPressed: () {
                openAppSettings(); // 사용자를 앱 설정 페이지로 이동
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    } else {
      // 권한 요청이 거부된 경우
      print("Camera permission was denied");
    }
  }
}
