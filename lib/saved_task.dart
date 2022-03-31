import 'package:data_app/tasks/Notes.dart';
import 'package:data_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller/welcome_controller.dart';
import 'HomeScreen.dart';
import 'privacy_policy.dart';

class Task extends GetView<WelcomeController> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFCFFFDC),

      appBar: AppBar(
        leading: IconButton(icon: Image.asset("assets/images/menu.png"),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        elevation: 0,
        backgroundColor: Color(0xFFCFFFDC),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Saved Notes",
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff9E00FF),
          ),
        ),
      ),

      drawer: Drawer(
        // backgroundColor: Color(0xFFFCF55F),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Color(0xFFFF00B8), Color(0xFF9E00FF)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFBA00E9),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(controller.user.photoURL!),
                backgroundColor: Colors.white,
              ),
              accountName: Text(
                "${controller.user.displayName}",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              accountEmail: Text(
                controller.user.email!,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ListTile(
              leading: Icon(Icons.home_filled, color: Colors.white),
              title: Text(
                "Home",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Get.to(
                  HomeScr(),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.collections_bookmark_rounded,
                  color: Colors.white),
              title: Text(
                "Saved Notes",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Get.to(
                  Task(),
                );
              },
            ),

            ListTile(
              leading: Icon(
                Icons.movie,
                color: Colors.white,
              ),
              title: Text(
                "Movies",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Get.to(ChangeTheme());
              },
            ),

            ListTile(
              leading: Icon(
                Icons.developer_mode_rounded,
                color: Colors.white,
              ),
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Get.to(
                  DevNotes(),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text(
                "Log Out",
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                controller.logout();
              },
            )
          ]),
        ),
      ),

      body:  Column(
        children: [
          Expanded(
            child: Container(
              width: 900,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18))),
              child: NotesPage(),
            ),
          ),
        ],
      ),
    );
  }
}

