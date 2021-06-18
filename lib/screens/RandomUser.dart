import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/components/RandomUser/RandomUserView.dart';
import 'package:fluttermvvmproviderdemo/notifiers/RandomUserNotifier.dart';
import 'package:fluttermvvmproviderdemo/services/api_service.dart';
import 'package:provider/provider.dart';

class RandomUser extends StatefulWidget {
  const RandomUser({Key key}) : super(key: key);

  @override
  _RandomUserState createState() => _RandomUserState();
}

class _RandomUserState extends State<RandomUser> {
  @override
  Widget build(BuildContext context) {
    RandomUserNotifier randomUserNotifier =
    Provider.of<RandomUserNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Random User"),
        ),
        body: randomUserNotifier != null
            ? Container(
          child:
              RandomUserView(
                  singleUserModel: randomUserNotifier.getSingleUser(),
                ),
          )
            : Text("No data found")
    );
  }

  @override
  void initState() {
    RandomUserNotifier randomUserNotifier =
    Provider.of<RandomUserNotifier>(context, listen: false);
    ApiService.getRandomUser(randomUserNotifier);
    super.initState();
  }
}
