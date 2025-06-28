import 'package:family_connect/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/app_const.dart';
import '../../localizations/language_keys.dart';

enum PersonType {
  head,
  member,
}

class BasePersonController extends GetxController {
  final PersonType personType;

  BasePersonController(this.personType);

  bool get isHead => personType == PersonType.head;

  bool get isMember => personType == PersonType.member;

  final formKey = GlobalKey<FormState>();

  // Focus nodes
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode middleNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode ageFocusNode = FocusNode();
  final FocusNode dutiesFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode altPhoneFocusNode = FocusNode();
  final FocusNode landLineFocusNode = FocusNode();
  final FocusNode socialMediaFocusNode = FocusNode();
  final FocusNode cityFocusNode = FocusNode();
  final FocusNode stateFocusNode = FocusNode();
  final FocusNode countryFocusNode = FocusNode();
  final FocusNode flatNoFocusNode = FocusNode();
  final FocusNode doorNoFocusNode = FocusNode();
  final FocusNode buildingFocusNode = FocusNode();
  final FocusNode streetFocusNode = FocusNode();
  final FocusNode landmarkFocusNode = FocusNode();
  final FocusNode districtFocusNode = FocusNode();
  final FocusNode nativeCityFocusNode = FocusNode();
  final FocusNode nativeStateFocusNode = FocusNode();
  final FocusNode pinCodeFocusNode = FocusNode();

  // Reactive text fields
  final RxString fullName = ''.obs;
  final RxString firstName = ''.obs;
  final RxString middleName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString age = ''.obs;
  final RxString duties = ''.obs;
  final RxString email = ''.obs;
  final RxString phone = ''.obs;
  final RxString altPhone = ''.obs;
  final RxString landline = ''.obs;
  final RxString socialMedia = ''.obs;
  final RxString city = ''.obs;
  final RxString state = ''.obs;
  final RxString country = ''.obs;
  final RxString flatNo = ''.obs;
  final RxString doorNo = ''.obs;
  final RxString buildingName = ''.obs;
  final RxString street = ''.obs;
  final RxString landmark = ''.obs;
  final RxString district = ''.obs;
  final RxString nativeCity = ''.obs;
  final RxString nativeState = ''.obs;
  final RxString pinCode = ''.obs;

  // Dropdown fields
  final RxString gender = AppConfig.genderList.first.obs;
  final RxString maritalStatus = AppConfig.maritalStatusList.first.obs;
  final RxString occupation = AppConfig.occupations.first.obs;
  final RxString qualification = AppConfig.qualifications.first.obs;
  final RxString bloodGroup = AppConfig.bloodGroupList.first.obs;
  final RxString samaj = AppConfig.samajList.first.obs;
  final RxString relation = AppConfig.relations.first.obs;

  final RxBool isValidFields = false.obs;

  void validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    isValidFields.value = isValid;
  }

  // Update functions
  void updateFullName(String val) {
    fullName.value = val;
    debounce(
      fullName,
      (_) => validateForm(),
      time: const Duration(
        milliseconds: 500,
      ),
    );
  }

  void updateFirstName(String val) {
    firstName.value = val;
    debounce(
      firstName,
      (_) => validateForm(),
      time: const Duration(
        milliseconds: 500,
      ),
    );
  }

  void updateMiddleName(String val) {
    middleName.value = val;
    debounce(
      middleName,
      (_) => validateForm(),
      time: const Duration(
        milliseconds: 500,
      ),
    );
  }

  void updateLastName(String val) {
    lastName.value = val;
    debounce(
      lastName,
      (_) => validateForm(),
      time: const Duration(
        milliseconds: 500,
      ),
    );
  }

  void updateAge(String val) {
    age.value = val;
    debounce(
      age,
      (_) => validateForm(),
      time: const Duration(
        milliseconds: 500,
      ),
    );
  }

  void updatePhone(String val) {
    phone.value = val;
    debounce(
      phone,
      (_) => validateForm(),
      time: const Duration(
        milliseconds: 500,
      ),
    );
  }

  void updateGender(String? val) =>
      gender.value = val ?? AppConfig.genderList.first;

  void updateMaritalStatus(String? val) =>
      maritalStatus.value = val ?? AppConfig.maritalStatusList.first;

  void updateOccupation(String? val) =>
      occupation.value = val ?? AppConfig.occupations.first;

  void updateQualification(String? val) =>
      qualification.value = val ?? AppConfig.qualifications.first;

  void updateBloodGroup(String? val) =>
      bloodGroup.value = val ?? AppConfig.bloodGroupList.first;

  void updateRelation(String? val) =>
      relation.value = val ?? AppConfig.relations.first;

  void updateSamaj(String? val) =>
      samaj.value = val ?? AppConfig.samajList.first;

  // Birth date field
  final Rxn<DateTime> birthDate = Rxn<DateTime>();

  void updateBirthDate(DateTime date) => birthDate.value = date;

  void updateDuties(String val) => duties.value = val;

  void updateEmail(String val) => email.value = val;

  void updateAltPhone(String val) => altPhone.value = val;

  void updateLandline(String val) => landline.value = val;

  void updateSocialMedia(String val) => socialMedia.value = val;

  void updateCity(String val) => city.value = val;

  void updateState(String val) => state.value = val;

  void updateCountry(String val) => country.value = val;

  void updateFlatNo(String val) => flatNo.value = val;

  void updateDoorNumber(String val) => doorNo.value = val;

  void updateBuildingName(String val) => buildingName.value = val;

  void updateStreet(String val) => street.value = val;

  void updateLandmark(String val) => landmark.value = val;

  void updateDistrict(String val) => district.value = val;

  void updateNativeCity(String val) => nativeCity.value = val;

  void updateNativeState(String val) => nativeState.value = val;

  void updatePinCode(String val) => pinCode.value = val;

  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LanguageKey.fullNameRequired.tr;
    }
    return null;
  }

  String? validateFirstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LanguageKey.firstNameRequired.tr;
    }
    return null;
  }

  String? validateMiddleName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LanguageKey.middleNameRequired.tr;
    }
    return null;
  }

  String? validateLastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LanguageKey.lastNameRequired.tr;
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LanguageKey.ageRequired.tr;
    }
    final parsed = int.tryParse(value);
    if (parsed == null || parsed <= 0) {
      return LanguageKey.enterValidAge.tr;
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LanguageKey.phoneNumberRequired.tr;
    } else if (!AppRegexConst.phoneRegex.hasMatch(value)) {
      return LanguageKey.enterValidPhoneNumber.tr;
    }
    return null;
  }

  @override
  void onClose() {
    fullNameFocusNode.dispose();
    firstNameFocusNode.dispose();
    middleNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    ageFocusNode.dispose();
    dutiesFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    altPhoneFocusNode.dispose();
    landLineFocusNode.dispose();
    socialMediaFocusNode.dispose();
    cityFocusNode.dispose();
    stateFocusNode.dispose();
    countryFocusNode.dispose();
    flatNoFocusNode.dispose();
    doorNoFocusNode.dispose();
    buildingFocusNode.dispose();
    streetFocusNode.dispose();
    landmarkFocusNode.dispose();
    districtFocusNode.dispose();
    nativeCityFocusNode.dispose();
    nativeStateFocusNode.dispose();
    pinCodeFocusNode.dispose();
    super.onClose();
  }
}
