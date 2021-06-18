import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/components/post/post_view.dart';
import 'package:fluttermvvmproviderdemo/notifiers/posts_notifier.dart';
import 'package:fluttermvvmproviderdemo/services/api_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  void initState() {
    PostsNotifier postNotifier =
        Provider.of<PostsNotifier>(context, listen: false);
    ApiService.getPosts(postNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PostsNotifier postNotifier = Provider.of<PostsNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("MVVM + Provider Demo"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, "/add_post");
              },
            )
          ],
        ),
        body: postNotifier != null
            ? Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Random User"),
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, "/random_user");
                      },
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/all_employee");
                      },
                      child: Text("AllEmployee"),
                      color: Colors.yellowAccent,
                    ),
                    
                    RaisedButton(onPressed: (){
                      Navigator.pushNamed(context, "/users_login");
                    })
                    
                  ],
              ),
                ))
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
