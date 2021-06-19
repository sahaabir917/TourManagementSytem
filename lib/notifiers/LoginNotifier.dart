import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/models/FailedModel.dart';
import 'package:fluttermvvmproviderdemo/models/TourUser.dart';
import 'package:fluttermvvmproviderdemo/models/UsersModel.dart';
import 'package:fluttermvvmproviderdemo/services/api_service.dart';

class LoginNotifier with ChangeNotifier {
  TourUser _usersModel = TourUser();
  FailedModel _failedModel = FailedModel();
  bool _isLoggedIn;

  void setUsersLoginData(TourUser usersModel) {
    _usersModel = usersModel;
    notifyListeners();
  }

  TourUser getUsersLogindata() {
    return _usersModel;
  }

  Future<bool> userLogincred(String email, String password) async {
    return await ApiService.getLoginInfo(email, password, this);
  }

  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
  }

  bool getIsLoggedIn() {
    return _isLoggedIn;
  }

  void setFailedData(FailedModel failedModel) {
    _failedModel = failedModel;
    notifyListeners();
  }

  FailedModel getFailedData() {
    return _failedModel;
  }
}
