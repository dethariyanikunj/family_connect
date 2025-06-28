import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import '../base_person_controller.dart';
import 'field_spacer_view.dart';
import 'header_view.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
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
          header: LanguageKey.profileSummary.tr,
        ),
        if (controller.isHead) const FieldSpacerView(),
        if (controller.isHead)
          AppOutlinedInputField(
            title: '${LanguageKey.fullName.tr}*',
            textInputType: TextInputType.name,
            focusNode: controller.fullNameFocusNode,
            textInputAction: TextInputAction.next,
            onTextChanged: controller.updateFullName,
            validator: (val) => controller.validateFullName(val),
          ),
        if (controller.isMember) const FieldSpacerView(),
        if (controller.isMember)
          AppOutlinedInputField(
            title: '${LanguageKey.firstName.tr}*',
            textInputType: TextInputType.name,
            focusNode: controller.firstNameFocusNode,
            textInputAction: TextInputAction.next,
            onTextChanged: controller.updateFirstName,
            validator: (val) => controller.validateFirstName(val),
          ),
        if (controller.isMember) const FieldSpacerView(),
        if (controller.isMember)
          AppOutlinedInputField(
            title: '${LanguageKey.middleName.tr}*',
            textInputType: TextInputType.name,
            focusNode: controller.middleNameFocusNode,
            textInputAction: TextInputAction.next,
            onTextChanged: controller.updateMiddleName,
            validator: (val) => controller.validateMiddleName(val),
          ),
        if (controller.isMember) const FieldSpacerView(),
        if (controller.isMember)
          AppOutlinedInputField(
            title: '${LanguageKey.lastName.tr}*',
            textInputType: TextInputType.name,
            focusNode: controller.lastNameFocusNode,
            textInputAction: TextInputAction.next,
            onTextChanged: controller.updateLastName,
            validator: (val) => controller.validateLastName(val),
          ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: '${LanguageKey.age.tr}*',
          textInputType: TextInputType.number,
          focusNode: controller.ageFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateAge,
          validator: (val) => controller.validateAge(val),
        ),
        AppDropdownField(
          title: LanguageKey.gender.tr,
          value: controller.gender.value,
          items: AppConfig.genderList,
          onChanged: controller.updateGender,
        ),
        AppDropdownField(
          title: LanguageKey.maritalStatus.tr,
          value: controller.maritalStatus.value,
          items: AppConfig.maritalStatusList,
          onChanged: controller.updateMaritalStatus,
        ),
        AppDropdownField(
          title: LanguageKey.occupation.tr,
          value: controller.occupation.value,
          items: AppConfig.occupations,
          onChanged: controller.updateOccupation,
        ),
        if (controller.isHead)
          AppDropdownField(
            title: LanguageKey.samajName.tr,
            value: controller.samaj.value,
            items: AppConfig.samajList,
            onChanged: controller.updateSamaj,
          ),
        AppDropdownField(
          title: LanguageKey.qualification.tr,
          value: controller.qualification.value,
          items: AppConfig.qualifications,
          onChanged: controller.updateQualification,
        ),
      ],
    );
  }
}
