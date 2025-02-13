class UserModel {
  int? avatarId;
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? phone;
  UserModel(
      {required this.avatarId,
      required this.name,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.phone});
  UserModel.init();
}
