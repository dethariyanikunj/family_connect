import 'package:get/get.dart';

import '../views/family_head/family_head.dart';
import '../views/family_member/family_member.dart';
import '../views/family_tree/family_tree.dart';
import '../views/home/home.dart';
import '../views/send_otp/send_otp.dart';
import '../views/splash/splash.dart';
import '../views/verify_otp/verify_otp.dart';
import '../widgets/app_widget.dart';

// All routes for app pages are defined here
class AppRoutes {
  static const String splashPage = '/splash_page';
  static const String noInternetPage = '/no_internet_page';
  static const String sendOtpPage = '/send_otp_page';
  static const String verifyOtpPage = '/verify_otp_page';
  static const String homePage = '/home_page';
  static const String familyHeadPage = '/family_head_page';
  static const String familyMemberPage = '/family_member_page';
  static const String familyTreePage = '/family_tree_page';

  static final List<GetPage> pages = [
    GetPage(
      name: splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: noInternetPage,
      page: () => const AppNoInternetView(),
    ),
    GetPage(
      name: homePage,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: sendOtpPage,
      page: () => const SendOtpPage(),
      binding: SendOtpBinding(),
    ),
    GetPage(
      name: verifyOtpPage,
      page: () => const VerifyOtpPage(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: familyHeadPage,
      page: () => const FamilyHeadPage(),
      binding: FamilyHeadBinding(),
    ),
    GetPage(
      name: familyMemberPage,
      page: () => const FamilyMemberPage(),
      binding: FamilyMemberBinding(),
    ),
    GetPage(
      name: familyTreePage,
      page: () => const FamilyTreePage(),
      binding: FamilyTreeBinding(),
    ),
  ];
}
