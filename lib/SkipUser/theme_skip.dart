import 'package:data_app/SkipUser/policy_skip.dart';
import 'package:data_app/privacy_policy.dart';
import 'package:data_app/saved_task.dart';
import 'package:data_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data_app/HomeScreen.dart';

import '../signuppage.dart';
import 'home_skip.dart';
import 'notes_skip.dart';

class SkipTheme extends StatelessWidget {
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
            "Movies",
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
          child:Container(
            decoration: BoxDecoration( gradient: LinearGradient( colors: <Color> [ Color(0xFFFF00B8),   Color(0xFF9E00FF) ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            ),

            child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[

                  UserAccountsDrawerHeader (

                    decoration: BoxDecoration(
                      color: Color(0xFFBA00E9),
                    ),

                    currentAccountPicture: CircleAvatar(
                      child: Image.asset('assets/images/icon.png'),
                      backgroundColor: Colors.white,
                    ),

                    accountName:Text("User Name",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),

                    accountEmail: Text("useremail@gmail.com",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),),

                  ),

                  SizedBox(height: 25,),

                  ListTile(
                    leading: Icon(Icons.home_filled,
                        color: Colors.white),
                    title: Text("Home",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),),
                    onTap: (){
                      Get.to(
                        SkipHome(),
                      );
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.collections_bookmark_rounded,
                        color: Colors.white),
                    title: Text("Saved Notes",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onTap: (){
                      Get.to(SkipTask());
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.movie,
                      color: Colors.white,),
                    title: Text("Movies",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),),
                    onTap: () {
                      Get.to(SkipTheme());
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.developer_mode_rounded,
                      color: Colors.white,),
                    title: Text("Privacy Policy",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),),
                    onTap: (){
                      Get.to(SkipPolicy());
                    },
                  ),

                  ListTile(
                    leading: Icon(Icons.account_circle,
                        color: Colors.white),
                    title: Text("Create Account",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),),
                    onTap: (){
                      Get.to(SignUpPage());
                    },
                  )

                ]
            ),
          ),
        ),

        body: Movie(),
    );
  }
}
