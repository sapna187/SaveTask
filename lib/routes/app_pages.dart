import 'package:data_app/tasks/Notes.dart';
import 'package:get/get.dart';
import 'package:data_app/HomeScreen.dart';
import '../../welcome_screen.dart';
import '../modules/Binding/home_binding.dart';
import '../modules/Binding/login_binding.dart';
import '../modules/Binding/welcome_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => Welcome(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScr(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WElCome,
      page: () => HomeScr(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.Notes,
      page: () => NotesPage(),
      binding: HomeBinding(),
    ),
  ];
}