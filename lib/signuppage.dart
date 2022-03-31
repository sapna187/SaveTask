import 'package:data_app/SkipUser/home_skip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'Controller/login_controller.dart';
import 'HomeScreen.dart';


class SignUpPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    //Google Sign Up Button
    final GoogleSignUpButton = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      color: Colors.white,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          controller.login();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 3, right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 28,
                child: Image.asset(
                    "assets/images/google.png"),
              ),
              Text("Continue with Google",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    //Skip Button
    final SkipButton = Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          Get.to(SkipHome());
        },
        child: Text("Skip for Now",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/astronomy-2297212_1920.jpg"
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  SizedBox(height: 50,),

                  GoogleSignUpButton,
                  SizedBox(height: 10,),

                  Align(
                    alignment: Alignment.center,
                    child: Text("Make sure to have an Internet Connection",
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFCFFFDC),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  SkipButton,
                  SizedBox(height: 50,),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
