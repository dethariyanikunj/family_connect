import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../widgets/app_widget.dart';
import '../base_person_controller.dart';
import 'field_spacer_view.dart';
import 'header_view.dart';

class ContactInfoSection extends StatelessWidget {
  const ContactInfoSection({
    super.key,
    required this.controller,
  });

  final BasePersonController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderView(
          header: LanguageKey.contactInfo.tr,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.email.tr,
          textInputType: TextInputType.emailAddress,
          focusNode: controller.emailFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateEmail,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: '${LanguageKey.phone.tr}*',
          textInputType: TextInputType.phone,
          focusNode: controller.phoneFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updatePhone,
          validator: (val) => controller.validatePhone(val),
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.alternatePhone.tr,
          textInputType: TextInputType.phone,
          focusNode: controller.altPhoneFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateAltPhone,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.landline.tr,
          textInputType: TextInputType.phone,
          focusNode: controller.landLineFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateLandline,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.socialMediaLink.tr,
          textInputType: TextInputType.url,
          focusNode: controller.socialMediaFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateSocialMedia,
        ),
      ],
    );
  }
}
