// lib/app/routes/app_pages.dart
import 'package:get/get.dart';

import '../modules/academy_auth/bindings/AcademyAuthBinding.dart';
import '../modules/academy_auth/views/academy_login_page.dart';
import '../modules/auth/views/login_page.dart';
import '../modules/auth/views/signup_page.dart';
import '../modules/game/game_binding.dart';
import '../modules/game/gamepage.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/game_setup/bindings/game_setup_binding.dart';
import '../modules/game_setup/views/game_setup_page.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_page.dart';
import 'app_routes.dart';



class AppPages {
  static final routes = [
    GetPage(
      name: Routes.GAME,
      page: () => GamePage(),
      binding: GameBinding(),
    ),
     GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.GAME_SETUP,
      page: () => GameSetupPage(),
      binding: GameSetupBinding(),
    ),
    GetPage(
      name: Routes.ACADEMY_LOGIN,
      page: () => AcademyLoginPage(),
      binding: AcademyAuthBinding(),
    ),
    // Add other routes
  ];
}
