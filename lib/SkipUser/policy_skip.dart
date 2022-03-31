import 'package:data_app/SkipUser/notes_skip.dart';
import 'package:data_app/SkipUser/theme_skip.dart';
import 'package:data_app/saved_task.dart';
import 'package:data_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data_app/HomeScreen.dart';

import '../signuppage.dart';
import 'home_skip.dart';

class SkipPolicy extends StatelessWidget {
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
            "Privacy Policy",
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

        body: Column(
          children: [

            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20.0),
                child: SizedBox(
                  height: 120,
                  width: 250,
                  child: Image.asset(
                    'assets/images/Firebase_Logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container( decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/earth-1756274_1920 (2).jpg"
                  ),
                  fit: BoxFit.cover,
                ),
              ),

                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      SizedBox(height: 18,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 18,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "This application is developed for demo purpose only.\nRe - distribution of this app or the source code in any format is strictly prohibited by its developer.",
                          style: TextStyle(
                            fontFamily: 'Uber',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 70.0,),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Contact developer at...",
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 3,),
                      Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Color(0xFFCFFFDC),
                          ),
                          SizedBox(width: 5,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "roman95181@gmail.com",
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFCFFFDC),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )



    );
  }
}
