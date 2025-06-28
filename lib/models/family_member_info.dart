class FamilyMemberInfo {
  String? firebaseDocId;
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime birthDate;
  final int age;
  final String gender;
  final String maritalStatus;
  final String qualification;
  final String occupation;
  final String duties;
  final String bloodGroup;
  final String relationToHead;
  final String photoUrl;
  final String phone;
  final String altPhone;
  final String landline;
  final String email;
  final String socialLink;
  final String flat;
  final String doorNumber;
  final String building;
  final String street;
  final String landmark;
  final String city;
  final String district;
  final String state;
  final String country;
  final String pinCode;
  final String nativeCity;
  final String nativeState;

  FamilyMemberInfo({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.birthDate,
    required this.age,
    required this.gender,
    required this.maritalStatus,
    required this.qualification,
    required this.occupation,
    required this.duties,
    required this.bloodGroup,
    required this.relationToHead,
    required this.photoUrl,
    required this.phone,
    required this.altPhone,
    required this.landline,
    required this.email,
    required this.socialLink,
    required this.doorNumber,
    required this.nativeCity,
    required this.nativeState,
    required this.flat,
    required this.building,
    required this.street,
    required this.landmark,
    required this.city,
    required this.district,
    required this.state,
    required this.country,
    required this.pinCode,
    this.firebaseDocId,
  });

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "middle_name": middleName,
      "last_name": lastName,
      "birth_date": birthDate.toIso8601String(),
      "age": age,
      "gender": gender,
      "marital_status": maritalStatus,
      "qualification": qualification,
      "occupation": occupation,
      "duties": duties,
      "blood_group": bloodGroup,
      "relation_to_head": relationToHead,
      "photo_url": photoUrl,
      "phone": phone,
      "alt_phone": altPhone,
      "landline": landline,
      "email": email,
      "social_link": socialLink,
      "flat": flat,
      "door_number": doorNumber,
      "building": building,
      "street": street,
      "landmark": landmark,
      "city": city,
      "district": district,
      "state": state,
      "country": country,
      "pin_code": pinCode,
      "native_city": nativeCity,
      "native_state": nativeState,
    };
  }

  factory FamilyMemberInfo.fromJson(Map<String, dynamic> json) {
    return FamilyMemberInfo(
      firstName: json['first_name'] ?? '',
      middleName: json['middle_name'] ?? '',
      lastName: json['last_name'] ?? '',
      birthDate: DateTime.parse(json['birth_date']),
      age: json['age'] ?? 0,
      gender: json['gender'] ?? '',
      maritalStatus: json['marital_status'] ?? '',
      qualification: json['qualification'] ?? '',
      occupation: json['occupation'] ?? '',
      duties: json['duties'] ?? '',
      bloodGroup: json['blood_group'] ?? '',
      relationToHead: json['relation_to_head'] ?? '',
      photoUrl: json['photo_url'] ?? '',
      phone: json['phone'] ?? '',
      altPhone: json['alt_phone'] ?? '',
      landline: json['landline'] ?? '',
      email: json['email'] ?? '',
      socialLink: json['social_link'] ?? '',
      flat: json['flat'] ?? '',
      doorNumber: json['door_number'] ?? '',
      building: json['building'] ?? '',
      street: json['street'] ?? '',
      landmark: json['landmark'] ?? '',
      city: json['city'] ?? '',
      district: json['district'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      pinCode: json['pin_code'] ?? '',
      nativeCity: json['native_city'] ?? '',
      nativeState: json['native_state'] ?? '',
    );
  }
}
