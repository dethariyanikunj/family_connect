import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import './verify_otp_controller.dart';

class VerifyOtpPage extends GetView<VerifyOtpController> {
  const VerifyOtpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenWidget(),
    );
  }

  Widget _screenWidget() {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppScreenTitleBar(
            title: LanguageKey.verifyNumber.tr,
          ),
          SizedBox(
            height: AppDimens.dimens15.h,
          ),
          Expanded(
            child: _contentWidget(),
          ),
        ],
      ),
    );
  }

  Widget _contentWidget() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.dimensScreenHorizontalMargin.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _verifyContentWidget(),
          SizedBox(
            height: AppDimens.dimens30.h,
          ),
          _otpFieldWidget(),
          _fieldSpacingWidget(),
          _resendOtpWidget(),
          _fieldSpacingWidget(),
          _submitWidget(),
        ],
      ),
    );
  }

  Widget _fieldSpacingWidget() {
    return SizedBox(
      height: AppDimens.dimens20.h,
    );
  }

  Widget _verifyContentWidget() {
    final darkStyle = TextStyle(
      fontSize: AppDimens.dimens16.sp,
      color: AppColors.color1F1A17,
      fontWeight: FontWeight.w600,
    );
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: AppTextStyle.textSize16Regular.copyWith(
          color: AppColors.color6C6C6C,
        ),
        children: [
          TextSpan(
            text: '${LanguageKey.weSentSms.tr} ',
          ),
          TextSpan(
            text: controller.mobileNumber,
            style: darkStyle,
          ),
          const TextSpan(
            text: '.',
          ),
          const TextSpan(
            text: ' ',
          ),
          TextSpan(
            text: LanguageKey.enterOtp.tr,
          ),
        ],
      ),
    );
  }

  Widget _otpFieldWidget() {
    return AppOtpField(
      textEditingController: controller.otpFieldController,
      focusNode: controller.otpFieldFocusNode,
      onOtpTextCompleted: (value) {
        controller.otp = value;
        controller.checkForValidOtp();
      },
    );
  }

  Widget _resendOtpWidget() {
    final defaultStyle = AppTextStyle.textSize16Regular.copyWith(
      color: AppColors.color6C6C6C,
    );
    final darkStyle = AppTextStyle.textSize16SemiBold;
    final darkerStyle = AppTextStyle.textSize16Bold.copyWith(
      color: AppColors.primary,
    );
    return Obx(
      () => RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: defaultStyle,
          children: [
            if (controller.isTimerRunning.isFalse)
              TextSpan(
                text: LanguageKey.resendOtp.tr,
                style: darkerStyle,
                recognizer: TapGestureRecognizer()
                  ..onTap = () => controller.onResendOtpClicked(),
              ),
            if (controller.isTimerRunning.isTrue)
              TextSpan(
                text: LanguageKey.resendOtp.tr,
              ),
            if (controller.isTimerRunning.isTrue)
              TextSpan(
                text: ' ${LanguageKey.resendOtpIn.tr} ',
              ),
            if (controller.isTimerRunning.isTrue)
              TextSpan(
                text: controller.timerText.value,
                style: darkStyle,
              ),
          ],
        ),
      ),
    );
  }

  Widget _submitWidget() {
    return Obx(
      () => AppFilledButton(
        text: LanguageKey.verifyOtp.tr,
        isDisabled: controller.isValidOtp.isFalse,
        onPressed: () => controller.verifyOtp(),
      ),
    );
  }
}
