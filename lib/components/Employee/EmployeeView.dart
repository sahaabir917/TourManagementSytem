import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/components/Employee/EmployeeViewModel.dart';
import 'package:fluttermvvmproviderdemo/models/EmployeeModel.dart';

class EmployeeView extends StatefulWidget {
  final EmployeeData employee;

  EmployeeView({@required this.employee});

  @override
  State createState() {
    return _EmployeeViewState(employee);
  }
}

class _EmployeeViewState extends State<EmployeeView> {
  EmployeeData employee;
  EmployeeViewModel employeeViewModel;

  _EmployeeViewState(this.employee) {
    employeeViewModel = new EmployeeViewModel();
    employeeViewModel.setemployee(employee);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            employeeViewModel.employee.id.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            employeeViewModel.employee.employeeSalary.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Divider(
                height: 1,
              ),
            ),
            Expanded(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(employeeViewModel.employee.employeeAge.toString()),
              ),
            ),
            Expanded(
              flex: 0,
              child: Divider(
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
