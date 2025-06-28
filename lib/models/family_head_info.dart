class FamilyHeadInfo {
  final String name;
  final int age;
  final String gender;
  final String maritalStatus;
  final String occupation;
  final String samajName;
  final String qualification;
  final DateTime birthDate;
  final String bloodGroup;
  final String duties;
  final String email;
  final String phone;
  final String altPhone;
  final String landline;
  final String socialLink;
  final String flat;
  final String building;
  final String street;
  final String landmark;
  final String city;
  final String district;
  final String state;
  final String nativeCity;
  final String nativeState;
  final String country;
  final String pinCode;
  final String temple;

  const FamilyHeadInfo({
    required this.name,
    required this.age,
    required this.gender,
    required this.maritalStatus,
    required this.occupation,
    required this.samajName,
    required this.qualification,
    required this.birthDate,
    required this.bloodGroup,
    required this.duties,
    required this.email,
    required this.phone,
    required this.altPhone,
    required this.landline,
    required this.socialLink,
    required this.flat,
    required this.building,
    required this.street,
    required this.landmark,
    required this.city,
    required this.district,
    required this.state,
    required this.nativeCity,
    required this.nativeState,
    required this.country,
    required this.pinCode,
    required this.temple,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "gender": gender,
      "marital_status": maritalStatus,
      "occupation": occupation,
      "samaj_name": samajName,
      "qualification": qualification,
      "birth_date": birthDate.toIso8601String(),
      "blood_group": bloodGroup,
      "duties": duties,
      "email": email,
      "phone": phone,
      "alt_phone": altPhone,
      "landline": landline,
      "social_link": socialLink,
      "flat": flat,
      "building": building,
      "street": street,
      "landmark": landmark,
      "city": city,
      "district": district,
      "state": state,
      "native_city": nativeCity,
      "native_state": nativeState,
      "country": country,
      "pincode": pinCode,
      "temple": temple,
    };
  }

  factory FamilyHeadInfo.fromJson(Map<String, dynamic> json) {
    return FamilyHeadInfo(
      name: json["name"] ?? '',
      age: json["age"] ?? 0,
      gender: json["gender"] ?? '',
      maritalStatus: json["marital_status"] ?? '',
      occupation: json["occupation"] ?? '',
      samajName: json["samaj_name"] ?? '',
      qualification: json["qualification"] ?? '',
      birthDate: DateTime.tryParse(json["birth_date"] ?? '') ?? DateTime(1970),
      bloodGroup: json["blood_group"] ?? '',
      duties: json["duties"] ?? '',
      email: json["email"] ?? '',
      phone: json["phone"] ?? '',
      altPhone: json["alt_phone"] ?? '',
      landline: json["landline"] ?? '',
      socialLink: json["social_link"] ?? '',
      flat: json["flat"] ?? '',
      building: json["building"] ?? '',
      street: json["street"] ?? '',
      landmark: json["landmark"] ?? '',
      city: json["city"] ?? '',
      district: json["district"] ?? '',
      state: json["state"] ?? '',
      nativeCity: json["native_city"] ?? '',
      nativeState: json["native_state"] ?? '',
      country: json["country"] ?? '',
      pinCode: json["pincode"] ?? '',
      temple: json["temple"] ?? '',
    );
  }
}
