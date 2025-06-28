import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../localizations/language_keys.dart';
import '../../../utils/app_utils.dart';
import '../../../widgets/app_widget.dart';
import '../home_controller.dart';

class ViewFamilyTreeDialog extends StatelessWidget {
  const ViewFamilyTreeDialog({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _mobileNumberFieldWidget(),
        SizedBox(
          height: AppDimens.dimens20.h,
        ),
        Obx(
          () => AppFilledButton(
            text: LanguageKey.verifyHead.tr,
            isDisabled: !controller.isValidMobileToViewTree,
            onPressed: () {
              Get.back(
                result: controller.mobileNoToViewTree.value.replaceAll(' ', ''),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _mobileNumberFieldWidget() {
    return AppOutlinedInputField(
      title: '${LanguageKey.addHeadMobileNo.tr}*',
      hintText: LanguageKey.enterMobileNumber.tr,
      textInputType: TextInputType.number,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        AppPhoneInputFormatter(),
      ],
      maxChars: AppConfig.mobileNoFieldLength,
      onTextChanged: (number) {
        controller.updateMobileNumberToViewTree(number);
      },
    );
  }
}
