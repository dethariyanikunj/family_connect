import './language_keys.dart';

class English {
  static Map<String, String> getStrings() {
    return {
      // Common
      LanguageKey.appName: 'Family Connect',
      LanguageKey.noInternetConnection:
          'It seems you are not connected to the internet.',
      LanguageKey.oopsSomethingWentWrong: 'Oops! Something went wrong.',

      // Authentication
      LanguageKey.login: 'Login',
      LanguageKey.sendOtp: 'Send OTP',
      LanguageKey.mobileNumber: 'Mobile Number',
      LanguageKey.enterMobileNumber: 'Enter Mobile Number',
      LanguageKey.otpSentSuccessfully: 'OTP sent successfully',
      LanguageKey.verifyNumber: 'Verify Number',
      LanguageKey.weSentSms: 'We sent an SMS with a verification code to',
      LanguageKey.enterOtp: 'Enter OTP',
      LanguageKey.resendOtp: 'Resend OTP',
      LanguageKey.resendOtpIn: 'in',
      LanguageKey.verifyOtp: 'Verify OTP',
      LanguageKey.otpVerifiedSuccessfully: 'OTP verified successfully',
      LanguageKey.otpVerificationFailed: 'OTP verification failed',
      LanguageKey.notes:
          'As Firebase billing account is not activated, use testing credentials for OTP verification',

      // Section Headers
      LanguageKey.headProfile: 'Family Head Profile',
      LanguageKey.profileSummary: 'Profile Summary',
      LanguageKey.personalInfo: 'Personal Info',
      LanguageKey.contactInfo: 'Contact Info',
      LanguageKey.address: 'Address',
      LanguageKey.memberProfile: 'Family Member Profile',

      // Form Fields
      LanguageKey.fullName: 'Full Name',
      LanguageKey.firstName: 'First Name',
      LanguageKey.middleName: 'Middle Name',
      LanguageKey.lastName: 'Last Name',
      LanguageKey.age: 'Age',
      LanguageKey.fullNameRequired: 'Full name is required',
      LanguageKey.firstNameRequired: 'First name is required',
      LanguageKey.middleNameRequired: 'Middle name is required',
      LanguageKey.lastNameRequired: 'Last name is required',
      LanguageKey.ageRequired: 'Age is required',
      LanguageKey.enterValidAge: 'Enter a valid age',
      LanguageKey.gender: 'Gender',
      LanguageKey.maritalStatus: 'Marital Status',
      LanguageKey.occupation: 'Occupation',
      LanguageKey.samajName: 'Samaj Name',
      LanguageKey.qualification: 'Qualification',
      LanguageKey.birthDate: 'Birth Date',
      LanguageKey.bloodGroup: 'Blood Group',
      LanguageKey.relationWithHead: 'Relation Family with Head',
      LanguageKey.duties: 'Nature of Duties',
      LanguageKey.email: 'Email',
      LanguageKey.phone: 'Phone Number',
      LanguageKey.alternatePhone: 'Alternate Phone',
      LanguageKey.landline: 'Landline',
      LanguageKey.socialMediaLink: 'Social Media Link',
      LanguageKey.flatNo: 'Flat No',
      LanguageKey.doorNo: 'Door No',
      LanguageKey.buildingName: 'Building Name',
      LanguageKey.street: 'Street',
      LanguageKey.landmark: 'Landmark',
      LanguageKey.city: 'City',
      LanguageKey.district: 'District',
      LanguageKey.state: 'State',
      LanguageKey.nativeCity: 'Native City',
      LanguageKey.nativeState: 'Native State',
      LanguageKey.country: 'Country',
      LanguageKey.pincode: 'Pincode',

      // Validators
      LanguageKey.pleaseSelectBirthDate: 'Please select birth date',
      LanguageKey.phoneNumberRequired: 'Phone number is required',
      LanguageKey.enterValidPhoneNumber:
          'Enter a valid 10-digit Indian phone number',
      LanguageKey.familyDetailSaved: 'Family detail saved successfully',
      LanguageKey.familyDetailSaveFailed: 'Family detail save failed',
      LanguageKey.noFamilyTree: 'No family tree available',
      LanguageKey.addFamilyMembersToSeeTree:
          'Add family members to see family tree',
      LanguageKey.noFamilyHeadFoundWithMobile:
          'No family head found with entered mobile number',

      // Buttons
      LanguageKey.addHeadMobileNo: 'Add Head Mobile No',
      LanguageKey.addHeads: 'Add Head',
      LanguageKey.saveHeadDetail: 'Save Head',
      LanguageKey.addMembers: 'Add Member',
      LanguageKey.saveMemberDetail: 'Save Member',
      LanguageKey.familyTree: 'Family Tree',
      LanguageKey.viewTree: 'View Family Tree',
      LanguageKey.export: 'Export PDF',
      LanguageKey.verifyHead: 'Verify Head',
      LanguageKey.showMembers: 'Delete Members',
      LanguageKey.delete: 'Delete',
      LanguageKey.memberDeletedSuccessfully: 'Member Deleted Successfully!',
    };
  }
}
