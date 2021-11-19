class AppUser {
  String name;
  String licenseNumber;
  String ID;
  String contact;
  String emailID;
  // String dpURL;
  bool hasCompleteProfile = false;

  AppUser();

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'licenseNumber': licenseNumber,
      'emailID': emailID,
      'ID':ID,
      // 'dpURL': dpURL,
      'hasCompletedProfile': hasCompleteProfile,
    };
  }

  AppUser.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    licenseNumber = data['licenseNumber'];
    contact = data['contact'];
    emailID = data['emailID'];
    ID= data['ID number'];
    // dpURL = data['dpURL'];
    hasCompleteProfile = data['hasCompleteProfile'];
  }
}

