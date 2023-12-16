import 'package:flutter/cupertino.dart';

import '../../../core/shared preferences/shared.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController =
  TextEditingController(text: MyCache.getString(key: MyChachKey.email));
  final TextEditingController passwordController =
  TextEditingController(text: MyCache.getString(key: MyChachKey.password));
  bool show = true ;

  changeIcon()
  {
    show = !show ;
    notifyListeners();
  }
}