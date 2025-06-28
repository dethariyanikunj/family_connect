import 'package:get/get.dart';

import '../../app_services/firestore_service.dart';
import '../../app_services/temple_link_service.dart';
import '../../localizations/language_keys.dart';
import '../../models/family_head_info.dart';
import '../../widgets/app_widget.dart';
import '../base_person_controller.dart';

class FamilyHeadController extends BasePersonController {
  FamilyHeadController() : super(PersonType.head);

  Future<void> saveAndAddMembers() async {
    final info = FamilyHeadInfo(
      name: fullName.value,
      age: int.tryParse(age.value) ?? 0,
      gender: gender.value,
      maritalStatus: maritalStatus.value,
      occupation: occupation.value,
      samajName: samaj.value,
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
      temple: TempleLinkService.getTempleForSamaj(samaj.value),
    );
    final isSaved = await FirestoreService().saveFamilyHead(info);
    if (isSaved) {
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
