import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/models/SingleUserModel.dart';

import 'RandomUserViewModel.dart';

class RandomUserView extends StatefulWidget {
  final SingleUserModel singleUserModel;
  RandomUserView({@required this.singleUserModel});

  @override
  _RandomUserViewState createState() => _RandomUserViewState(singleUserModel);
}

class _RandomUserViewState extends State<RandomUserView> {
  SingleUserModel singleUserModel;
  RandomUserViewModel randomUserViewModel;

  _RandomUserViewState(this.singleUserModel) {
    randomUserViewModel = new RandomUserViewModel();
    randomUserViewModel.setSingleUser(singleUserModel);
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
                            randomUserViewModel.singleUserModel.results[0].name.first.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            randomUserViewModel.singleUserModel.results[0].name.first.toString(),
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
                child: Text(randomUserViewModel.singleUserModel.results[0].name.first.toString(),),
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
