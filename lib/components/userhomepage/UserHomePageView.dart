import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/Preference/SharedPreferenceHelper.dart';
import 'package:fluttermvvmproviderdemo/components/userhomepage/UserHomePageViewModel.dart';
import 'package:fluttermvvmproviderdemo/models/TourUser.dart';
import 'package:fluttermvvmproviderdemo/models/UsersModel.dart';
import 'package:fluttermvvmproviderdemo/screens/DashBoardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHomePageView extends StatefulWidget {
  final TourUser usersModel;

  UserHomePageView({@required this.usersModel});

  @override
  _UserHomePageViewState createState() => _UserHomePageViewState(usersModel);
}

class _UserHomePageViewState extends State<UserHomePageView> {
  TourUser usersModel;
  UserHomePageViewModel homePageViewModel;

  String msg;

  String username;

  TourUser usersModel1;

  _UserHomePageViewState(this.usersModel) {
    homePageViewModel = new UserHomePageViewModel();
    homePageViewModel.setUserLogindata(usersModel);
  }

  @override
  void initState() {
    // var isLoggedIn = initCheckIsLoggedMood();
    // if (isLoggedIn != null && isLoggedIn==true) {
    //   msg = "welcome to dashboard ${homePageViewModel.UserModel.data.email}";
    // } else {
    //   msg = "You have to login first";
    // }

    getUserName();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: Container(
        child: Center(
          child: Text("welcome to dashboard ${homePageViewModel.UserModel.data.user.email}"),
        ),
      ),
    );
  }

   getUserName() async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     usersModel1 = TourUser.fromJson(json.decode(preferences.getString("userData")));
     username = usersModel1.data.user.email;
  }
}
