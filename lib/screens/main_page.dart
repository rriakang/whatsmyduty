import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:get/get.dart';
import 'package:myduty/widgets/popup.dart';
import 'package:myduty/services/camera_service.dart';
import 'package:myduty/services/gallery_service.dart';
import 'package:myduty/widgets/image_section.dart';

class Myduty extends StatefulWidget {
  @override
  _MydutyState createState() => _MydutyState();
  Color myBlueColor = Color(0xFFE1EEFF);

}


class _MydutyState extends State<Myduty> with TickerProviderStateMixin {
  late TabController _tabController;
  GlobalKey _registerTabKey = GlobalKey();
  bool isMenuShown = false; // 팝업이 표시되었는지 여부를 추적하는 플래그
  String? selectedImagePath; // 선택한 이미지의 경로를 저장할 변수
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.index == 2 && !isMenuShown) { // "등록" 탭이 선택되었을 경우
      _showPopupMenu();
      isMenuShown = true; // 메뉴가 표시된 것으로 표시
    } else {
      isMenuShown = false; // 다른 탭으로 이동했으므로 플래그를 리셋합니다.
    }
  }

  void _showPopupMenu() {
    final RenderBox renderBox = _registerTabKey.currentContext?.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy - renderBox.size.height, // 탭의 높이만큼 위로 올립니다.
        offset.dx + renderBox.size.width,
        offset.dy,
      ),
      items: [
        PopupMenuItem(
          child: Text("카메라"),
          value: "camera",
        ),
        PopupMenuItem(
          child: Text("사진 추가"),
          value: "gallery",
        ),
      ],
    ).then((value) {
      // 메뉴가 선택되거나 취소되었으므로 플래그를 리셋합니다.
      isMenuShown = false;

      // "카메라" 항목이 선택되었다면 _openCamera() 메소드를 호출합니다.
      if (value == "camera") {
        CameraService.openCamera(context);
      }

      else if (value == "gallery") {
        _pickImage();
      }
    });
  }
  Future<void> _pickImage() async {
    final result = await GalleryService.openGallery();
    if (result != null) {
      setState(() {
        selectedImagePath = result;
      });
    }
  }
  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 250),
        title: Text('서울 삼성 병원'),
        centerTitle: true,
        elevation: 0.0,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black26,
                // backgroundImage: AssetImage('assets/gozero.png'),
              ),
              accountName: Text(
                '강리라',
                style: TextStyle(
                color: Colors.black, // 여기서 원하는 색상으로 변경
              ),),
              accountEmail: Text(
                  'rirakang@gachon.ac.kr',
                  style: TextStyle(
                  color: Colors.black, // 여기서 원하는 색상으로 변경
                ),
              ),
              onDetailsPressed: () {
                print('Hello, My Hope World!');
              },
              decoration: BoxDecoration(
                color: Color(0xFFE1EEFF),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: () {
                print('Home button is clicked!');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('settings'),
              onTap: () {
                print('settings button is clicked!');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('Q&A'),
              onTap: () {
                print('Q&A button is clicked!');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("D-123"),
            SizedBox(height: 100),
            Row(
              children: <Widget>[
                Expanded(
                  child: SfCalendar(
                    view: CalendarView.month,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.group, color: Colors.black),
              text: '동료',
            ),
            Tab(
              icon: Icon(Icons.home, color: Colors.black),
              text: '홈',
            ),
            Tab(
              key: _registerTabKey, // '등록' 탭에 GlobalKey를 할당합니다.
              icon: Icon(Icons.add_box, color: Colors.black),
              text: '등록',
            ),
          ],
        ),
      ),
    );
  }
}
