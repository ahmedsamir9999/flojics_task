import 'package:flutter/cupertino.dart';

class RegisterProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool show = true;

  bool check = false;

  changeIcon() {
    show = !show;
    notifyListeners();
  }

  changeCheck() {
    check = !check;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    super.dispose();
  }
}
