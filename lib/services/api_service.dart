import 'dart:convert';
import 'dart:math';
import 'package:fluttermvvmproviderdemo/Preference/SharedPreferenceHelper.dart';
import 'package:fluttermvvmproviderdemo/models/EmployeeModel.dart';
import 'package:fluttermvvmproviderdemo/models/SingleUserModel.dart';
import 'package:fluttermvvmproviderdemo/models/UsersModel.dart';
import 'package:fluttermvvmproviderdemo/models/post.dart';
import 'package:fluttermvvmproviderdemo/notifiers/EmployeeNotifier.dart';
import 'package:fluttermvvmproviderdemo/notifiers/LoginNotifier.dart';
import 'package:fluttermvvmproviderdemo/notifiers/RandomUserNotifier.dart';
import 'package:fluttermvvmproviderdemo/notifiers/posts_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String API_ENDPOINT =
      "https://jsonplaceholder.typicode.com/posts";

  static const String API_ENDPOINT2 =
      "https://dummy.restapiexample.com/api/v1/employees";
  static const String API_ENDPOINT3 = "https://randomuser.me/api/";
  static const String API_ENDPOINT4 = "https://demo.guruklub.com/user/login";

  static SharedPreferences pref;
  static SharedPreferenceHelper sharedPreferenceHelper =
      new SharedPreferenceHelper();

  static UsersModel usersModel;

  static UsersModel userdata;

  static String user;

  static Future<UsersModel> userdatas;

  ApiService() {}

  static getPosts(PostsNotifier postNotifier) async {
    List<Post> postList = [];
    http.get(API_ENDPOINT).then((response) {
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      }

      List posts = jsonDecode(response.body);
      posts.forEach((element) {
        postList.add(Post.fromMap(element));
      });

      print(postList.length);
      postNotifier.setPostList(postList);
    });
  }

  static getEmployee(EmployeeNotifier employeeNotifier) async {
    EmployeeModel employeeModel = EmployeeModel();

    http.get(API_ENDPOINT2).then((response) {
      if (response.statusCode == 200) {
        print('Response body: ${response.body}');

        EmployeeModel employee_data =
            EmployeeModel.fromJson(jsonDecode(response.body));
        employeeNotifier.setEmployeeList(employee_data.data);
      }
    });
  }

  static void getRandomUser(RandomUserNotifier randomUserNotifier) {
    http.get(API_ENDPOINT3).then((response) async {
      print('Response body: ${response.body}');
      SharedPreferences pref1 = await SharedPreferences.getInstance();
      SingleUserModel single_user_data =
          SingleUserModel.fromJson(jsonDecode(response.body));
      randomUserNotifier.setRandomUserData(single_user_data);
    });
  }

  static Future<bool> addPost(Post post, PostsNotifier postNotifier) async {
    print("addPost");
    bool result = false;
    await http
        .post(API_ENDPOINT,
            headers: {"Content-type": "application/json; charset=UTF-8"},
            body: json.encode(post.toMap()))
        .then((response) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        print("successful");
        result = true;
        postNotifier.addPostToList(post);
      }
    });

    return result;
  }

  static Future<bool> getLoginInfo(String email, String password, LoginNotifier loginNotifier) async {
    // var map = new Map<String, dynamic>();
    // map['email'] = email;
    // map['password'] = password;

    var body = {"email": "${email}", "password": "${password}"};

    // await http.post(API_ENDPOINT4, body: body).then((response)  {
    //   print('Response body: ${response.body}');
    //   // SharedPreferences pref = await SharedPreferences.getInstance();
    //   if(response.statusCode ==200){
    //     sharedPreferenceHelper.setUserData(response.body);
    //     sharedPreferenceHelper.setIsLoggedIn(true);
    //     UsersModel usersModel =
    //     UsersModel.fromJson(jsonDecode(response.body));
    //     loginNotifier.setUsersLoginData(usersModel);
    //   }
    //   else{
    //     print("status code is not 200");
    //     //loginnotifier.serusersLoginData is null and setisloggin should be false;
    //   }
    // });

    print("user login data");
    bool result = false;
    await http.post(API_ENDPOINT4, body: body).then((response) {
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print("successful");
        result = true;
        sharedPreferenceHelper.setUserData(response.body);
        UsersModel usersModel = UsersModel.fromJson(jsonDecode(response.body));
        loginNotifier.setUsersLoginData(usersModel);
        loginNotifier.setIsLoggedIn(true);
        if(usersModel.data!= null){
          sharedPreferenceHelper.setIsLoggedIn(true);
        }
        else{
          sharedPreferenceHelper.setIsLoggedIn(false);
        }
      }
      else{
        loginNotifier.setIsLoggedIn(false);
        sharedPreferenceHelper.setUserData(response.body);
        // sharedPreferenceHelper.setIsLoggedIn(false);
      }
    });

    return result;
  }

  void initSharedPref() async {
    SharedPreferences pref1 = await SharedPreferences.getInstance();
    UsersModel usersModel =
        UsersModel.fromJson(json.decode(pref1.getString("userData")));
    print(usersModel.data.email);
  }
}
