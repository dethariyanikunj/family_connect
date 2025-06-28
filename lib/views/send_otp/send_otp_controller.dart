import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_services/firebase_auth_service.dart';
import '../../const/app_const.dart';
import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';

class SendOtpController extends GetxController {
  RxString mobileNumber = ''.obs;
  final mobileNumberFocusNode = FocusNode();

  bool get isValidMobileNumber =>
      mobileNumber.trim().isNotEmpty &&
      mobileNumber.trim().length == AppConfig.mobileNoFieldLength;

  void updateMobileNumber(String number) {
    mobileNumber.value = number;
  }

  Future<void> sendOtp() async {
    mobileNumberFocusNode.unfocus();
    AppProgressDialog.show();
    try {
      await FirebaseAuthService()
          .sendOTP('${AppConfig.defaultCountryCode}${mobileNumber.value}',
              (String verificationId) {
        AppProgressDialog.hide();
        _showToastToSendOtpSuccessfully();
        _navigateToVerifyScreen(verificationId);
      }, (String? message) {
        AppProgressDialog.hide();
        _showToastForFailure(
          message ?? LanguageKey.oopsSomethingWentWrong.tr,
        );
      });
    } catch (e) {
      AppProgressDialog.hide();
      _showToastForFailure(e.toString());
    }
  }

  void _showToastToSendOtpSuccessfully() {
    AppToastView.showSuccessToast(
      message: LanguageKey.otpSentSuccessfully.tr,
    );
  }

  void _showToastForFailure(String message) {
    AppToastView.showErrorToast(message: message);
  }

  void _navigateToVerifyScreen(String verificationId) {
    Get.toNamed(
      AppRoutes.verifyOtpPage,
      arguments: {
        AppKeyConst.keyMobileNo:
            '${AppConfig.defaultCountryCode} ${mobileNumber.trim()}',
        AppKeyConst.keyVerificationId: verificationId,
      },
    );
  }
}
