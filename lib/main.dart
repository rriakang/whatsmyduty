import 'package:flutter/material.dart'; //플러터 머터리얼 import 라이브러리



void main() => runApp(MyApp());





class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First app',
      theme: ThemeData.light().copyWith( //디자인
        appBarTheme: AppBarTheme(
      ),
      ),
      home: MyCard(),//앱이 정상적으로 실행되었을때 가장 먼저 보여주는 경로
    );
  }


}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    //scaffold : 중요함 , 어떠한 요소들도 . 앱화면에 배치될수없음
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromARGB(1, 250, 250, 250),
        // 데이터 받을곳 (근무지)
        title: Text('Seoul Hospital'), //앱 화면에 출력되는 타이틀 --> 데이터 받을곳
        centerTitle: true,
        elevation: 0.0,

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //여백 x
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("강리라"),
              accountEmail: Text("rirakang@gachon.ac.kr"),
              currentAccountPicture: CircleAvatar(

              ),

              onDetailsPressed: () => {
                print("clicked")
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color:Colors.grey[850],), // 첫 부분
              title: Text("Home"),
              onTap: () => {
                print("home!!")
              },
              trailing: Icon(Icons.add), //끝 부분
            ),
            ListTile(
              leading: Icon(Icons.settings, color:Colors.grey[850],), // 첫 부분
              title: Text("Setting"),
              onTap: () => {
                print("Setting!!")
              },
              trailing: Icon(Icons.add), //끝 부분
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color:Colors.grey[850],), // 첫 부분
              title: Text("Q&A"),
              onTap: () => {
                print("Q&A!!")
              },
              trailing: Icon(Icons.add), //끝 부분
            ),
          ],


        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //시작점 정렬
          children: <Widget>[
            Center(
              child : CircleAvatar(
              radius: 60.0,
             ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0, //divder 선 margin같은 느낌
            ),
            Text('NAME',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0, //간격 조절
            ),
            Text('test',
              style: TextStyle(
                color:  Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
              ),

            ), SizedBox(
              height: 30.0, //간격 조절
            ),
            Text('test',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0, //간격 조절
            ),
            Text('100',
              style: TextStyle(
                  color:  Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),

            ),SizedBox(
              height: 30.0, //간격 조절
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width : 10.0,
                ),
                Text('test',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0
                ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width : 10.0,
                ),
                Text('test',
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width : 10.0,
                ),
                Text('test',
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0
                  ),
                ),
              ],

            ),Row(
              children: <Widget>[

                SizedBox(
                  width: 10.0,
                  height : 200.0,
                ),
                Text('test',
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0

                  ),
                ),

              ],
            ),





          ],
        )
      ),


    );
  }

}
