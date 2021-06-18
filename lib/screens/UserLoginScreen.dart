
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/components/RandomUser/RandomUserView.dart';
import 'package:fluttermvvmproviderdemo/components/userhomepage/UserHomePageView.dart';
import 'package:fluttermvvmproviderdemo/models/UsersModel.dart';
import 'package:fluttermvvmproviderdemo/notifiers/LoginNotifier.dart';
import 'package:fluttermvvmproviderdemo/screens/DashBoardScreen.dart';
import 'package:fluttermvvmproviderdemo/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({Key key}) : super(key: key);

  @override
  _UserLoginScreenState createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  String email;
  String password;
  bool isLoading = false;
  bool isLogin = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        title: Text("User Login"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Name",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15)
                  ),
                  onChanged: (value){
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Password",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15)
                  ),
                  obscureText: true,
                  onChanged: (value){
                    password = value;
                  },
                ),
              ),
              RaisedButton(onPressed: () {
                LoginNotifier loginNotifier = Provider.of<LoginNotifier>(context,listen: false);
                loginNotifier.getUsersLogindata();
                // ApiService.getLoginInfo(loginNotifier,email,password);
                // if(loginNotifier!=null){
                // Navigator.pushNamed(context, "/dashboard");
                // }
                // else{
                //   Navigator.pushNamed(context, "/LoginScreen");
                // }
                isLoading = true;
                loginNotifier.userLogincred(email,password).then((value) {
                  if (value) {
                    // _showSnackBar("successfully login", context);
                    print("successfully login");
                    // Navigator.pushNamedAndRemoveUntil(context, "/user_login", (value) => false);
                    Navigator.pushNamed(context, "/dashboard");
                  }

                  // Navigator.pushNamed(context, "/home_screen");
                });

              })
            ],
          ),
        ),
      )
    );
  }

  @override
  void initState() {
      checkIsLoginMood();
  }

  checkIsLoginMood() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getBool("isLogin") == true){
      LoginNotifier loginNotifier = Provider.of<LoginNotifier>(context,listen: false);
     UsersModel usersModel1 = UsersModel.fromJson(json.decode(preferences.getString("userData")));
     loginNotifier.setUsersLoginData(usersModel1);
      Navigator.pushNamed(context, "/dashboard");
    }

  }


}



