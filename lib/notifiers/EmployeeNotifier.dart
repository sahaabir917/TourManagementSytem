import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/models/EmployeeModel.dart';


class EmployeeNotifier with ChangeNotifier{
  EmployeeModel employeeModel = EmployeeModel();
  EmployeeModel _employeeModel = EmployeeModel();
  List<EmployeeData> _employeeList = [];


      setEmployeeModel(EmployeeModel employeeModel) {
        _employeeModel = EmployeeModel();
        _employeeModel = employeeModel;
        notifyListeners();
      }

      EmployeeModel getEmployee(){
        return _employeeModel;
      }

   setEmployeeList(List<EmployeeData> employeeList) {
     _employeeList = [];
     _employeeList = employeeList;
     notifyListeners();
  }

  List<EmployeeData> getEmployees(){
        return _employeeList;
  }

}