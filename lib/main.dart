import 'package:flutter/material.dart';
import 'package:fluttermvvmproviderdemo/notifiers/EmployeeNotifier.dart';
import 'package:fluttermvvmproviderdemo/notifiers/posts_notifier.dart';
import 'package:fluttermvvmproviderdemo/screens/AllEmployee.dart';
import 'package:fluttermvvmproviderdemo/screens/DashBoardScreen.dart';
import 'package:fluttermvvmproviderdemo/screens/RandomUser.dart';
import 'package:fluttermvvmproviderdemo/screens/UserLoginScreen.dart';
import 'package:fluttermvvmproviderdemo/screens/add_post_screen.dart';
import 'package:fluttermvvmproviderdemo/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'notifiers/LoginNotifier.dart';
import 'notifiers/RandomUserNotifier.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PostsNotifier(),
      ),
      ChangeNotifierProvider(create: (context) => EmployeeNotifier()),
      ChangeNotifierProvider(create: (context) => RandomUserNotifier()),
      ChangeNotifierProvider(create: (context) => LoginNotifier()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(title: 'Flutter Demo Home Page'),
      routes: {
        "/add_post" : (context)=> AddPostScreen(),
        "/all_employee" :(context) => AllEmployee(),
        "/random_user" :(context) => RandomUser(),
        "/user_login" : (context) => UserLoginScreen(),
        "/users_login" : (context) => UserLoginScreen(),
        "/home_screen" : (context) => HomeScreen(title: 'Flutter Demo Home Page'),
        "/dashboard" :(context) => DashBoardScreen(),
      },
    );
  }
}
