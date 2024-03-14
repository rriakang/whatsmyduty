import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Ensure the content fits on small devices
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 250.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'whats my duty?',
                  style: TextStyle(fontSize: 24.0), // 글꼴 크기를 24로 설정
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.center,
                child: Text('간편 회원가입으로 시작하세요'),
              ),
            ),
            // 네이버로 시작하기 버튼
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
              child: ElevatedButton.icon(
                icon: Image.asset('assets/naver_icon.png', height: 18.0), // 네이버 아이콘
                label: Text(
                  '네이버로 시작하기',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                onPressed: () {
                  // 네이버 로그인 로직
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF1EC800)), // 네이버 색상
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12.0)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            // 카카오로 시작하기 버튼
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  // 카카오 로그인 로직
                },
                child: Text('카카오로 시작하기'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                ),
              ),
            ),
            // 애플로 시작하기 버튼
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  // 애플 로그인 로직
                },
                child: Text('애플로 시작하기'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
