class AppUser {
  String? Uid;
  String? idnumber;
  String? licensenumber;
  String? name;
  String? phone_number;
  String? email;
  String? password;

  AppUser({Uid});



  // factory AppUser.fromFirestore(dynamic user){
  //   return AppUser(
  //     Uid:user.get('Uid')
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'licenseNumber': licenseNumber,
  //     'emailID': emailID,
  //     'ID':ID,
  //     // 'dpURL': dpURL,
  //     'hasCompletedProfile': hasCompleteProfile,
  //   };
  // }
  //
  // AppUser.fromMap(Map<String, dynamic> data) {
  //   name = data['name'];
  //   licenseNumber = data['licenseNumber'];
  //   contact = data['contact'];
  //   emailID = data['emailID'];
  //   ID= data['ID number'];
  //   // dpURL = data['dpURL'];
  //   hasCompleteProfile = data['hasCompleteProfile'];
  // }
}

