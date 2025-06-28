import 'package:get/get.dart';

import './family_head_controller.dart';

class FamilyHeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FamilyHeadController());
  }
}
