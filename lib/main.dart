import 'package:flutter/material.dart';
//import 'package:myduty/screens/main_page.dart';
import 'package:table_calendar/table_calendar.dart';





void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First app',
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(),
      ),
      home: MyCard(),
    );
  }
}



class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromARGB(1, 250, 250, 250),
        title: Text('Seoul Hospital'),
        centerTitle: true,
        elevation: 0.0,
      ),
      endDrawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("강리라"),
              accountEmail: Text("rirakang@gachon.ac.kr"),
              currentAccountPicture: CircleAvatar(),
              onDetailsPressed: () => print("clicked"),
              decoration: BoxDecoration(
                color: Colors.red[200],
              ),
            ),
            ListTile(
              trailing: Icon(Icons.home, color:Colors.grey[850]),
              title: Text("Duty 유형 수정"),
              onTap: () => print("home!!"),
            ),
            ListTile(
              trailing: Icon(Icons.group, color:Colors.grey[850]),
              title: Text("공유하기"),
              onTap: () => print("공유하기"),
            ),
            ListTile(
              trailing: Icon(Icons.settings, color:Colors.grey[850]),
              title: Text("설정"),
              onTap: () => print("Setting!!"),
            ),
            ListTile(
              trailing: Icon(Icons.question_answer, color:Colors.grey[850]),
              title: Text("Q&A"),
              onTap: () => print("Q&A!!"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: DefaultTabController(
        length: 3,
        child: Builder(
          builder: (BuildContext context) {
            return SizedBox(
              height: 80,
              child: Column(
                children: [
                  TabBar(
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(
                          Icons.group,
                          color: Colors.black,

                        ),
                        child: Text(
                        '동료',
                        ),

                      ),
                      Tab(
                        icon: Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        child: Text(
                          '홈',
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.add_box,
                          color: Colors.black,
                        ),
                        child: Text(
                          '등록',
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
