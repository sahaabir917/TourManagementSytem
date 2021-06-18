import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/models/UsersModel.dart';
import 'package:fluttermvvmproviderdemo/services/api_service.dart';

class LoginNotifier with ChangeNotifier{

  UsersModel _usersModel = UsersModel();
  bool _isLoggedIn;

  void setUsersLoginData(UsersModel usersModel) {
    _usersModel = usersModel;
    notifyListeners();
  }

  UsersModel getUsersLogindata(){
    return _usersModel;
  }

  Future<bool> userLogincred(String email, String password) async{
    return await ApiService.getLoginInfo(email, password,this);
  }

  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
  }

  bool getIsLoggedIn(){
    return _isLoggedIn;
  }



}