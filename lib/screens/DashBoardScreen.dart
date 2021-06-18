import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/components/userhomepage/UserHomePageView.dart';
import 'package:fluttermvvmproviderdemo/notifiers/LoginNotifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  var isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    LoginNotifier loginNotifier = Provider.of<LoginNotifier>(
        context, listen: false);
    return Scaffold(
        body: loginNotifier
            .getUsersLogindata()
            .data != null ? Container(
          child: UserHomePageView(
            usersModel: loginNotifier.getUsersLogindata(),
          ),
        ) : AlertDialog(
          title: const Text('Login Failed!'),
          content: new Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(loginNotifier.getUsersLogindata().message[0]),
            ],
          ),
          actions: <Widget>[
            new FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "/user_login");
              },
              textColor: Theme
                  .of(context)
                  .primaryColor,
              child: const Text('Try Again'),
            ),
          ],
        )
    );
  }

  @override
  void initState() {
    super.initState();
  }
}

