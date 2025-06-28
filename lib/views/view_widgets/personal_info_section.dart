import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import '../base_person_controller.dart';
import 'field_spacer_view.dart';
import 'header_view.dart';

class PersonalInfoSection extends StatelessWidget {
  const PersonalInfoSection({
    super.key,
    required this.controller,
  });

  final BasePersonController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (controller.isHead)
          HeaderView(
            header: LanguageKey.personalInfo.tr,
          ),
        if (controller.isHead) const FieldSpacerView(),
        Obx(
          () {
            return GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: controller.birthDate.value ?? DateTime(1990),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) controller.updateBirthDate(picked);
              },
              child: AbsorbPointer(
                child: AppOutlinedInputField(
                  title: LanguageKey.birthDate.tr,
                  textInputType: TextInputType.text,
                  controller: TextEditingController(
                    text: controller.birthDate.value != null
                        ? controller.birthDate.value!
                            .toLocal()
                            .toString()
                            .split(' ')[0]
                        : '',
                  ),
                  onTextChanged: (_) {},
                ),
              ),
            );
          },
        ),
        const FieldSpacerView(),
        AppDropdownField(
          title: LanguageKey.bloodGroup.tr,
          value: controller.bloodGroup.value,
          items: AppConfig.bloodGroupList,
          onChanged: controller.updateBloodGroup,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.duties.tr,
          textInputType: TextInputType.text,
          focusNode: controller.dutiesFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateDuties,
        ),
        if (controller.isMember) const FieldSpacerView(),
        if (controller.isMember) const FieldSpacerView(),
        AppDropdownField(
          title: LanguageKey.relationWithHead.tr,
          value: controller.relation.value,
          items: AppConfig.relations,
          onChanged: controller.updateRelation,
        ),
      ],
    );
  }
}
