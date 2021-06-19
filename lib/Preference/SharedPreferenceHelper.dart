import 'dart:convert';
import 'dart:ffi';

import 'package:fluttermvvmproviderdemo/models/UsersModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferences pref;

  void clearData() async {
    pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  void setUserData(String jsonEncode) async {
    pref = await SharedPreferences.getInstance();
    pref.setString("userData", jsonEncode);
  }

  void setIsLoggedIn(bool isLogin) async {
    pref = await SharedPreferences.getInstance();
    pref.setBool("isLogin", isLogin);
    pref.commit();
  }

  UsersModel getUserData() {
    // initSharedPref();
    // UsersModel usersModel= UsersModel.fromJson(json.decode(pref.getString("userData")));
    // return usersModel;

    // Map<String, dynamic> userMap;
    // final String userStr = pref.getString('userData');
    // if (userStr != null) {
    //   userMap = jsonDecode(userStr) as Map<String, dynamic>;
    // }
    //
    // if (userMap != null) {
    //   final UsersModel usersModel = UsersModel.fromJson(userMap);
    //   // print(usersModel.data.email);
    //   print(usersModel);
    //   return usersModel;
    // }
    // return null;
  }

  void setFailedData(String response) async {
    pref = await SharedPreferences.getInstance();
    pref.setString("failedloginmsg", response);
  }
}
