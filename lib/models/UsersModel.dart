class UsersModel {
  bool status;
  int statusCode;
  List<String> message;
  String token;
  Users data;

  UsersModel(
      {this.status, this.statusCode, this.message, this.token, this.data});

  UsersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'].cast<String>();
    token = json['token'];
    data = json['data'] != null ? new Users.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Users {
  String id;
  String email;
  String name;
  String password;
  String displayName;
  String phone;
  String gender;
  String dob;
  Null picture;
  Null coverPicture;
  Null emailStatus;
  String phoneStatus;
  String toc;
  String status;
  String categoryId;
  Null subjectId;
  String joinDate;
  String notification;
  String regType;
  String tokenKey;
  String userGameLevel;
  String userHearts;
  UserSettings userSettings;
  GlobalSettings globalSettings;
  Null heartsSubscription;
  Null heartsGift;

  Users(
      {this.id,
        this.email,
        this.name,
        this.password,
        this.displayName,
        this.phone,
        this.gender,
        this.dob,
        this.picture,
        this.coverPicture,
        this.emailStatus,
        this.phoneStatus,
        this.toc,
        this.status,
        this.categoryId,
        this.subjectId,
        this.joinDate,
        this.notification,
        this.regType,
        this.tokenKey,
        this.userGameLevel,
        this.userHearts,
        this.userSettings,
        this.globalSettings,
        this.heartsSubscription,
        this.heartsGift});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    password = json['password'];
    displayName = json['display_name'];
    phone = json['phone'];
    gender = json['gender'];
    dob = json['dob'];
    picture = json['picture'];
    coverPicture = json['cover_picture'];
    emailStatus = json['email_status'];
    phoneStatus = json['phone_status'];
    toc = json['toc'];
    status = json['status'];
    categoryId = json['category_id'];
    subjectId = json['subject_id'];
    joinDate = json['join_date'];
    notification = json['notification'];
    regType = json['reg_type'];
    tokenKey = json['token_key'];
    userGameLevel = json['user_game_level'];
    userHearts = json['user_hearts'];
    userSettings = json['user_settings'] != null
        ? new UserSettings.fromJson(json['user_settings'])
        : null;
    globalSettings = json['global_settings'] != null
        ? new GlobalSettings.fromJson(json['global_settings'])
        : null;
    heartsSubscription = json['hearts_subscription'];
    heartsGift = json['hearts_gift'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    data['display_name'] = this.displayName;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['picture'] = this.picture;
    data['cover_picture'] = this.coverPicture;
    data['email_status'] = this.emailStatus;
    data['phone_status'] = this.phoneStatus;
    data['toc'] = this.toc;
    data['status'] = this.status;
    data['category_id'] = this.categoryId;
    data['subject_id'] = this.subjectId;
    data['join_date'] = this.joinDate;
    data['notification'] = this.notification;
    data['reg_type'] = this.regType;
    data['token_key'] = this.tokenKey;
    data['user_game_level'] = this.userGameLevel;
    data['user_hearts'] = this.userHearts;
    if (this.userSettings != null) {
      data['user_settings'] = this.userSettings.toJson();
    }
    if (this.globalSettings != null) {
      data['global_settings'] = this.globalSettings.toJson();
    }
    data['hearts_subscription'] = this.heartsSubscription;
    data['hearts_gift'] = this.heartsGift;
    return data;
  }
}

class UserSettings {
  String id;
  String adsFree;
  String gameSound;
  String gameBackgroundMusic;
  String userShareLimit;
  String userAdsLimit;
  String loginCount;

  UserSettings(
      {this.id,
        this.adsFree,
        this.gameSound,
        this.gameBackgroundMusic,
        this.userShareLimit,
        this.userAdsLimit,
        this.loginCount});

  UserSettings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    adsFree = json['ads_free'];
    gameSound = json['game_sound'];
    gameBackgroundMusic = json['game_background_music'];
    userShareLimit = json['user_share_limit'];
    userAdsLimit = json['user_ads_limit'];
    loginCount = json['login_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ads_free'] = this.adsFree;
    data['game_sound'] = this.gameSound;
    data['game_background_music'] = this.gameBackgroundMusic;
    data['user_share_limit'] = this.userShareLimit;
    data['user_ads_limit'] = this.userAdsLimit;
    data['login_count'] = this.loginCount;
    return data;
  }
}

class GlobalSettings {
  String adsLimit;
  String shareLimit;

  GlobalSettings({this.adsLimit, this.shareLimit});

  GlobalSettings.fromJson(Map<String, dynamic> json) {
    adsLimit = json['ads_limit'];
    shareLimit = json['share_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ads_limit'] = this.adsLimit;
    data['share_limit'] = this.shareLimit;
    return data;
  }
}