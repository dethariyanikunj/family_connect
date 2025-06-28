import 'dart:ui';

class AppConfig {
  static const String appName = 'Family Connect';
  static const int splashTimer = 2;

  // 10 digit and 1 for space between
  static const int mobileNoFieldLength = 11;
  static const int mobileFormatterLength = 5;
  static const int mobileOtpLength = 6;
  static const int resendOtpLength = 10;
  static const bool isRefreshTokenEnabled = false;
  static const bool isOtpPrefilledWithClipBoard = false;
  static Size figmaScreenSize = const Size(428, 926);
  static const String defaultCountryCode = '+91';

  static const List<String> genderList = [
    'Male',
    'Female',
    'Other',
    'Prefer not to say'
  ];

  static const List<String> maritalStatusList = [
    'Single',
    'Married',
    'Divorced',
    'Widowed',
    'Separated',
    'In a Relationship'
  ];

  static const List<String> bloodGroupList = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
    'Unknown'
  ];

  static const List<String> samajList = [
    'Gujarati',
    'Marathi',
    'Rajasthani',
    'Punjabi',
    'Bengali',
    'Tamil',
    'Telugu',
    'Malayali',
    'Other'
  ];

  static const List<String> qualifications = [
    'High School',
    'Diploma',
    'Graduate',
    'Post Graduate',
    'PhD',
    'Professional Certification',
    'Other'
  ];

  static const List<String> occupations = [
    'Farmer',
    'Engineer',
    'Doctor',
    'Business',
    'Government Employee',
    'Private Sector',
    'Self-Employed',
    'Student',
    'Homemaker',
    'Retired',
    'Other'
  ];

  static const List<String> relations = [
    'Father',
    'Mother',
    'Husband',
    'Wife',
    'Spouse',
    'Son',
    'Daughter',
    'Brother',
    'Sister',
    'Grandfather',
    'Grandmother',
    'Uncle',
    'Aunt',
    'Cousin',
    'Nephew',
    'Niece',
    'Friend',
    'Other'
  ];
}
