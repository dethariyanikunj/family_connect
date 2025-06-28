import 'package:get/get.dart';

import './family_tree_controller.dart';

class FamilyTreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FamilyTreeController());
  }
}
