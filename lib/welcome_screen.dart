import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:data_app/signuppage.dart';

import 'HomeScreen.dart';
import 'SkipUser/home_skip.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/sunset-1026239_1920.jpg"
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100,),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Welcome to\nyour Destination",
                    style: TextStyle(
                        fontFamily: "Uber",
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontFamily: "Uber",
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    IconButton(
                      icon: Image.asset("assets/images/go.png",),
                      iconSize: 45,
                      onPressed: (){
                        Get.to(SignUpPage());
                      },
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        SkipHome(),
                      );
                    },
                    child: Text(
                      "Skip For Now",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFFCFFFDC),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  )
                ),
                SizedBox(height: 10,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
