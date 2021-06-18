import 'package:fluttermvvmproviderdemo/models/UsersModel.dart';

class UserHomePageViewModel {
  UsersModel _usersModel;

  setUserLogindata(UsersModel usersModel) {
    _usersModel = usersModel;
  }

  UsersModel get UserModel => _usersModel;
}