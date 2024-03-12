import 'package:flutter/material.dart';

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
      drawer: Drawer(
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
              leading: Icon(Icons.home, color:Colors.grey[850]),
              title: Text("Duty 유형 수정"),
              onTap: () => print("home!!"),
            ),
            ListTile(
              leading: Icon(Icons.group, color:Colors.grey[850]),
              title: Text("공유하기"),
              onTap: () => print("공유하기"),
            ),
            ListTile(
              leading: Icon(Icons.settings, color:Colors.grey[850]),
              title: Text("설정"),
              onTap: () => print("Setting!!"),
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color:Colors.grey[850]),
              title: Text("Q&A"),
              onTap: () => print("Q&A!!"),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: DefaultTabController(
      //   length: 3,
      //   child: Builder(
      //     builder: (BuildContext context) {
      //       return SizedBox(
      //         height: 70,
      //         child: Column(
      //           children: [
      //             TabBar(
      //               tabs: <Widget>[
      //                 Tab(
      //                   icon: Icon(
      //                     Icons.person,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //                 Tab(
      //                   icon: Icon(
      //                     Icons.home,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //                 Tab(
      //                   icon: Icon(
      //                     Icons.chat_bubble,
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Expanded(
      //               child: TabBarView(
      //                 children: <Widget>[
      //                   Container(
      //                     child: Text('Person Tab Content'),
      //                   ),
      //                   Container(
      //                     child: Text('Home Tab Content'),
      //                   ),
      //                   Container(
      //                     child: Text('Chat Tab Content'),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
