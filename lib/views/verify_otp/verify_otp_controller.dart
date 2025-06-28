import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../app_services/firebase_auth_service.dart';
import '../../const/app_const.dart';
import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';

class VerifyOtpController extends GetxController {
  TextEditingController otpFieldController = TextEditingController();
  FocusNode otpFieldFocusNode = FocusNode();

  String mobileNumber = '';
  String verificationId = '';
  String otp = '';
  RxBool isValidOtp = false.obs;

  RxString timerText = ''.obs;

  // Total duration in seconds (2 minutes)
  int totalSeconds = AppConfig.resendOtpLength;

  // Observable boolean to check if timer is running
  RxBool isTimerRunning = false.obs;

  late Timer _countDownTimer;

  @override
  void onInit() {
    final arguments = Get.arguments;
    if (arguments is Map<String, dynamic> &&
        arguments.containsKey(AppKeyConst.keyMobileNo) &&
        arguments.containsKey(AppKeyConst.keyVerificationId)) {
      mobileNumber = Get.arguments[AppKeyConst.keyMobileNo];
      verificationId = Get.arguments[AppKeyConst.keyVerificationId];
    }
    _startTimerToResendOtp();
    super.onInit();
  }

  void _startTimerToResendOtp() {
    // Mark the timer as running
    isTimerRunning.value = true;

    timerText.value = AppDateTimeUtils.formatSecondsToTime(
      AppConfig.resendOtpLength,
    );

    // Initialize the timer
    _countDownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSeconds > 0) {
        totalSeconds--;
        int minutes = totalSeconds ~/ 60;
        int seconds = totalSeconds % 60;
        timerText.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      } else {
        // Stop the timer when the countdown ends
        _cancelCountDown();
      }
    });
  }

  void checkForValidOtp() {
    isValidOtp.value = otp.trim().length == AppConfig.mobileOtpLength;
  }

  Future onResendOtpClicked() async {
    await _callApiToReSendOtp();
    _startTimerToResendOtp();
  }

  void verifyOtp() async {
    AppProgressDialog.show();
    try {
      final response = await FirebaseAuthService().verifyOTP(
        verificationId,
        otp,
      );
      _onOtpVerifySuccess(response);
    } catch (e) {
      _onOtpVerificationFailed(LanguageKey.otpVerificationFailed.tr);
    }
    AppProgressDialog.hide();
  }

  Future _callApiToReSendOtp() async {
    AppProgressDialog.show();
    try {
      await FirebaseAuthService().resendOTP(
        mobileNumber,
        (verificationId) {
          AppProgressDialog.hide();
          _showToastToReSendOtpSuccessfully();
        },
        (error) {
          AppProgressDialog.hide();
          _showToastForFailure(error.toString());
        },
      );
    } catch (error) {
      AppProgressDialog.hide();
      _showToastForFailure(error.toString());
    }
  }

  Future _onOtpVerifySuccess(UserCredential response) async {
    AppToastView.showSuccessToast(
      message: LanguageKey.otpVerifiedSuccessfully.tr,
    );
    _navigateToHomeScreen();
  }

  void _onOtpVerificationFailed(String? message) {
    otp = '';
    checkForValidOtp();
    AppToastView.showErrorToast(message: message);
    otpFieldController.text = '';
    if (Get.context != null) {
      FocusScope.of(Get.context!).requestFocus(otpFieldFocusNode);
    }
  }

  void _showToastToReSendOtpSuccessfully() {
    AppToastView.showSuccessToast(
      message: LanguageKey.otpSentSuccessfully.tr,
    );
  }

  void _showToastForFailure(String message) {
    AppToastView.showErrorToast(
      message: message,
    );
  }

  void _cancelCountDown() {
    _countDownTimer.cancel();
    isTimerRunning.value = false;
    totalSeconds = AppConfig.resendOtpLength;
  }

  void _navigateToHomeScreen() {
    Get.offAllNamed(AppRoutes.homePage);
  }

  @override
  void onClose() {
    _cancelCountDown();
    isValidOtp.value = false;
    otpFieldController.dispose();
    otpFieldFocusNode.dispose();
    super.onClose();
  }
}
