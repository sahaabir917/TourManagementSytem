import 'package:fluttermvvmproviderdemo/models/TourUser.dart';
import 'package:fluttermvvmproviderdemo/models/UsersModel.dart';

class UserHomePageViewModel {
  TourUser _usersModel;

  setUserLogindata(TourUser usersModel) {
    _usersModel = usersModel;
  }

  TourUser get UserModel => _usersModel;
}
