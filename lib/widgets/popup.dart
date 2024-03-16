import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.group),
              onPressed: () {
                // 네비게이션 처리
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // 네비게이션 처리
              },
            ),
            IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {
                // 탭 클릭 시 팝업 메뉴 표시
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(100.0, 100.0, 100.0, 100.0), // 메뉴 위치 조정 필요
                  items: [
                    PopupMenuItem(
                      child: Text("카메라"),
                      value: "카메라",
                    ),
                    PopupMenuItem(
                      child: Text("사진 추가"),
                      value: "사진 추가",
                    ),
                  ],
                ).then((value) {
                  // 선택에 따른 동작 처리
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
