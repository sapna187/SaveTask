import 'package:data_app/routes/app_pages.dart';
import 'package:data_app/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'modules/Binding/home_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HomeBinding().dependencies();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Sapna",
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      home: Welcome(),
    ),
  );
}
