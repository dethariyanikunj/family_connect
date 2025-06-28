import 'package:get/get.dart';

import '../../app_services/firestore_service.dart';
import '../../const/app_const.dart';
import '../../localizations/language_keys.dart';
import '../../models/family_member_info.dart';
import '../../widgets/app_widget.dart';
import '../base_person_controller.dart';

class FamilyMemberController extends BasePersonController {
  String headPhoneNo = '';
  String headName = '';
  final List<FamilyMemberInfo> _members = [];

  List<FamilyMemberInfo> get familyMembers => _members;

  FamilyMemberController() : super(PersonType.member);

  @override
  void onInit() {
    final arguments = Get.arguments;
    if (arguments is Map<String, dynamic> &&
        arguments.containsKey(AppKeyConst.keyMobileNo)) {
      headPhoneNo = Get.arguments[AppKeyConst.keyMobileNo];
    }
    super.onInit();
  }

  Future<void> saveFamilyMemberInfo() async {
    final info = FamilyMemberInfo(
      firstName: firstName.value,
      middleName: middleName.value,
      lastName: lastName.value,
      age: int.tryParse(age.value) ?? 0,
      gender: gender.value,
      maritalStatus: maritalStatus.value,
      occupation: occupation.value,
      qualification: qualification.value,
      birthDate: birthDate.value ?? DateTime.now(),
      bloodGroup: bloodGroup.value,
      duties: duties.value,
      email: email.value,
      phone: phone.value,
      altPhone: altPhone.value,
      landline: landline.value,
      socialLink: socialMedia.value,
      flat: flatNo.value,
      doorNumber: doorNo.value,
      building: buildingName.value,
      street: street.value,
      landmark: landmark.value,
      city: city.value,
      district: district.value,
      state: state.value,
      nativeCity: nativeCity.value,
      nativeState: nativeState.value,
      country: country.value,
      pinCode: pinCode.value,
      relationToHead: relation.value,
      photoUrl: '',
    );
    final savedMember = await FirestoreService().saveFamilyMember(
      headPhoneNo,
      info,
    );
    if (savedMember != null) {
      _members.add(info);
      _showSuccessMessage();
      Get.back();
    } else {
      _showFailureMessage();
    }
  }

  void _showSuccessMessage() {
    AppToastView.showSuccessToast(
      message: LanguageKey.familyDetailSaved.tr,
    );
  }

  void _showFailureMessage() {
    AppToastView.showErrorToast(
      message: LanguageKey.familyDetailSaveFailed.tr,
    );
  }
}
