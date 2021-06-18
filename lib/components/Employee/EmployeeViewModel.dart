import 'package:fluttermvvmproviderdemo/models/EmployeeModel.dart';

class EmployeeViewModel{
  EmployeeData _employee;

  setemployee(EmployeeData employee) {
    _employee = employee;
  }

  EmployeeData get employee => _employee;
}
