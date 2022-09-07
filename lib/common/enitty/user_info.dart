/*
 * @Author: zcw
 * @Date: 2022-09-07 14:33:30
 * @LastEditTime: 2022-09-07 18:21:45
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/common/enitty/user_info.dart
 */

import 'package:flutter/foundation.dart';

class UserInfo with ChangeNotifier {
  
  String? userName;

  UserInfo._internal() {

  }

  static final UserInfo _instance = UserInfo._internal();
  factory UserInfo() => _instance;

  void changeUserInfo() {
    notifyListeners();
  }
}

