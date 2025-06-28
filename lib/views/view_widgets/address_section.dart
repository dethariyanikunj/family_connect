import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../localizations/language_keys.dart';
import '../../widgets/app_widget.dart';
import '../base_person_controller.dart';
import 'field_spacer_view.dart';
import 'header_view.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({
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
          header: LanguageKey.address.tr,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.flatNo.tr,
          textInputType: TextInputType.text,
          focusNode: controller.flatNoFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateFlatNo,
        ),
        if (controller.isMember) const FieldSpacerView(),
        if (controller.isMember)
          AppOutlinedInputField(
            title: LanguageKey.doorNo.tr,
            textInputType: TextInputType.text,
            focusNode: controller.doorNoFocusNode,
            textInputAction: TextInputAction.next,
            onTextChanged: controller.updateDoorNumber,
          ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.buildingName.tr,
          textInputType: TextInputType.text,
          focusNode: controller.buildingFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateBuildingName,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.street.tr,
          textInputType: TextInputType.text,
          focusNode: controller.streetFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateStreet,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.landmark.tr,
          textInputType: TextInputType.text,
          focusNode: controller.landmarkFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateLandmark,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.city.tr,
          textInputType: TextInputType.text,
          focusNode: controller.cityFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateCity,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.district.tr,
          textInputType: TextInputType.text,
          focusNode: controller.districtFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateDistrict,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.state.tr,
          textInputType: TextInputType.text,
          focusNode: controller.stateFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateState,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.nativeCity.tr,
          textInputType: TextInputType.text,
          focusNode: controller.nativeCityFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateNativeCity,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.nativeState.tr,
          textInputType: TextInputType.text,
          focusNode: controller.nativeStateFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateNativeState,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.country.tr,
          textInputType: TextInputType.text,
          focusNode: controller.countryFocusNode,
          textInputAction: TextInputAction.next,
          onTextChanged: controller.updateCountry,
        ),
        const FieldSpacerView(),
        AppOutlinedInputField(
          title: LanguageKey.pincode.tr,
          textInputType: TextInputType.number,
          focusNode: controller.pinCodeFocusNode,
          textInputAction: TextInputAction.done,
          onTextChanged: controller.updatePinCode,
        ),
      ],
    );
  }
}
