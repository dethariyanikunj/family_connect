import 'package:get/get.dart';

import '../../app_services/firestore_service.dart';
import '../../const/app_const.dart';
import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import './option.dart';

class HomeController extends GetxController {
  RxString mobileNoToViewTree = ''.obs;

  bool get isValidMobileToViewTree =>
      mobileNoToViewTree.trim().isNotEmpty &&
      mobileNoToViewTree.trim().length == AppConfig.mobileNoFieldLength;

  void updateMobileNumberToViewTree(String number) {
    mobileNoToViewTree.value = number;
  }

  void navigateToFamilyHead() {
    Get.toNamed(AppRoutes.familyHeadPage);
  }

  Future<void> verifyMobileNo(Option option, String mobileNo) async {
    bool isValid = false;
    AppProgressDialog.show();
    isValid = await FirestoreService().isFamilyHeadAvailable(mobileNo);
    AppProgressDialog.hide();

    if (isValid) {
      switch (option) {
        case Option.addMember:
          _navigateToAddMembers(mobileNo);
          break;
        case Option.viewTree:
          _navigateToFamilyTree(mobileNo);
          break;
      }
    } else {
      _showToastForFailure(LanguageKey.noFamilyHeadFoundWithMobile.tr);
    }
  }

  void _showToastForFailure(String message) {
    AppToastView.showErrorToast(message: message);
  }

  void _navigateToAddMembers(String mobileNo) {
    Get.toNamed(
      AppRoutes.familyMemberPage,
      arguments: {
        AppKeyConst.keyMobileNo: mobileNo,
      },
    );
  }

  void _navigateToFamilyTree(String mobileNo) {
    Get.toNamed(
      AppRoutes.familyTreePage,
      arguments: {
        AppKeyConst.keyMobileNo: mobileNo,
      },
    );
  }
}
