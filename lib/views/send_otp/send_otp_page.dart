import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import './send_otp_controller.dart';

class SendOtpPage extends GetView<SendOtpController> {
  const SendOtpPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _contentWidget(),
    );
  }

  Widget _contentWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimens.dimensScreenHorizontalMargin.w,
          vertical: AppDimens.dimens20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _appNameWidget(),
            SizedBox(
              height: AppDimens.dimens30.h,
            ),
            _mobileNumberFieldWidget(),
            SizedBox(
              height: AppDimens.dimens20.h,
            ),
            _sendOtpWidget(),
            SizedBox(
              height: AppDimens.dimens10.h,
            ),
            _notesWidget(),
          ],
        ),
      ),
    );
  }

  Widget _appNameWidget() {
    return Text(
      LanguageKey.login.tr,
      style: AppTextStyle.textSize32Bold.copyWith(
        color: AppColors.primary,
      ),
    );
  }

  Widget _mobileNumberFieldWidget() {
    return AppOutlinedInputField(
      title: '${LanguageKey.mobileNumber.tr}*',
      hintText: LanguageKey.enterMobileNumber.tr,
      textInputType: TextInputType.number,
      textInputAction: TextInputAction.done,
      focusNode: controller.mobileNumberFocusNode,
      unFocusOnTapOutside: true,
      prefix: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: AppDimens.dimens10.w,
          ),
          Text(
            AppConfig.defaultCountryCode,
            style: AppTextStyle.textSize16Regular,
          ),
          SizedBox(
            width: AppDimens.dimens10.w,
          ),
        ],
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        AppPhoneInputFormatter(),
      ],
      maxChars: AppConfig.mobileNoFieldLength,
      onTextChanged: (value) {
        controller.updateMobileNumber(value);
      },
    );
  }

  Widget _sendOtpWidget() {
    return Obx(
      () => AppFilledButton(
        text: LanguageKey.sendOtp.tr,
        isDisabled: !controller.isValidMobileNumber,
        onPressed: () => controller.sendOtp(),
      ),
    );
  }

  Widget _notesWidget() {
    return Text(
      LanguageKey.notes.tr,
      style: AppTextStyle.textSize12Regular.copyWith(
        color: AppColors.colorD32F2F,
      ),
    );
  }
}
