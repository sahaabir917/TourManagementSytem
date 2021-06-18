import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/models/SingleUserModel.dart';

class RandomUserNotifier with ChangeNotifier{

  SingleUserModel singleUserModel = SingleUserModel();

  void setRandomUserData(SingleUserModel single_user_data) {
    singleUserModel = single_user_data;
    notifyListeners();
  }

  SingleUserModel getSingleUser(){
    return singleUserModel;
  }

}