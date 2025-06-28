import 'package:get/get.dart';

import './family_member_controller.dart';

class FamilyMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FamilyMemberController());
  }
}
