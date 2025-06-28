import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../utils/app_utils.dart';
import '../../widgets/app_widget.dart';
import '../view_widgets/address_section.dart';
import '../view_widgets/contact_info_section.dart';
import '../view_widgets/personal_info_section.dart';
import '../view_widgets/profile_section.dart';
import '../view_widgets/section_field_spacer_view.dart';
import './family_head_controller.dart';

class FamilyHeadPage extends GetView<FamilyHeadController> {
  const FamilyHeadPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppScreenTitleBar(
            title: LanguageKey.headProfile.tr,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.dimensScreenHorizontalMargin.w,
              ),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileSection(controller: controller),
                    const SectionFieldSpacerView(),
                    PersonalInfoSection(controller: controller),
                    const SectionFieldSpacerView(),
                    ContactInfoSection(controller: controller),
                    const SectionFieldSpacerView(),
                    AddressSection(controller: controller),
                    SizedBox(height: AppDimens.dimens30.h),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDimens.dimensScreenHorizontalMargin.w,
              vertical: AppDimens.dimens20.h,
            ),
            child: Obx(
              () => AppFilledButton(
                text: LanguageKey.saveHeadDetail.tr,
                isDisabled: !controller.isValidFields.value,
                onPressed: () => controller.saveAndAddMembers(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
