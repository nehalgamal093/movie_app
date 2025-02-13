import 'package:flutter/material.dart';

class ChangeState extends ChangeNotifier {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool obscureNewPassword = true;
  bool obscureOldPassword = true;
  void changeObscurePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void changeObscureConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }
  void changeOldPasswordObscure() {
    obscureOldPassword = !obscureOldPassword;
    notifyListeners();
  }
  void changeNewPasswordObscure() {
    obscureNewPassword = !obscureNewPassword;
    notifyListeners();
  }
}
