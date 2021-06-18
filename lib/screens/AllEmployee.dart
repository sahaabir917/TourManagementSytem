import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/components/Employee/EmployeeView.dart';
import 'package:fluttermvvmproviderdemo/notifiers/EmployeeNotifier.dart';
import 'package:fluttermvvmproviderdemo/services/api_service.dart';
import 'package:provider/provider.dart';

class AllEmployee extends StatefulWidget {

  @override
  _AllEmployeeState createState() => _AllEmployeeState();
}

class _AllEmployeeState extends State<AllEmployee> {

  @override
  Widget build(BuildContext context) {
    EmployeeNotifier employeeNotifier = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("MVVM + Provider Demo"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add),onPressed: (){
              Navigator.pushNamed(context, "/add_post");
            },)
          ],
        ),
        body: employeeNotifier != null
            ? Container(
            color: Colors.black12,
            child: ListView.builder(
                itemCount: employeeNotifier.getEmployees().length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(0),
                    key: ObjectKey(employeeNotifier.getEmployees()[index]),
                    child: EmployeeView(
                      employee: employeeNotifier.getEmployees()[index],
                    ),
                  );
                }))
            : Center(
          child: CircularProgressIndicator(),
        ));
  }

  @override
  void initState() {
    EmployeeNotifier employeeNotifier = Provider.of(context,listen: false);
    ApiService.getEmployee(employeeNotifier);
    super.initState();
  }
}
