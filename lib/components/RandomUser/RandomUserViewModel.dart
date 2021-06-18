import 'package:fluttermvvmproviderdemo/models/EmployeeModel.dart';
import 'package:fluttermvvmproviderdemo/models/SingleUserModel.dart';

class RandomUserViewModel{
  SingleUserModel _singleUserModel;

  setSingleUser(SingleUserModel singleUserModel) {
    _singleUserModel = singleUserModel;
  }

  SingleUserModel get singleUserModel => _singleUserModel;
}
