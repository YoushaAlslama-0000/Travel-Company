// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:flight_app/common/enums/data_type.dart';
import 'package:flight_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceRepository {
  SharedPreferences pref = prefs;
  //KEYs

  String PREF_APP_LANG = 'app_language';
  String PRF_FIRST_LUN = "fisrt_lunch";
  String PRF_IS_LOGGED = "is_logged";
  String PREF_USER_DATA = 'user_data';
  String PREF_GAMES_PLAYED_NUM = 'games_playes_num';
  String PREF_FAVORITE_LIST = 'favorite_list';
  String PREF_GAMES_LIST = 'games_list';
  String PREF_VERIFICATION_CODE = 'verification_code';
  String PREF_CATEGOREY_NAME = 'categorey_name';

  final String PREF_PROFILE_IMAGE_PATH = 'profile_image_path';

  void setProfileImagePath(String path) {
    setpreference(
      type: DataType.STRING,
      key: PREF_PROFILE_IMAGE_PATH,
      value: path,
    );
  }

  String getProfileImagePath() {
    if (pref.containsKey(PREF_PROFILE_IMAGE_PATH)) {
      return getpreference(PREF_PROFILE_IMAGE_PATH) ?? '';
    } else {
      return '';
    }
  }

  void setFirstLunch(bool value) {
    setpreference(type: DataType.BOOL, key: PRF_FIRST_LUN, value: value);
  }

  bool getFirstLunch() {
    if (pref.containsKey(PRF_FIRST_LUN)) {
      return getpreference(PRF_FIRST_LUN);
    } else {
      return true;
    }
  }

  void setVerificationCode(String value) {
    setpreference(
      type: DataType.STRING,
      key: PREF_VERIFICATION_CODE,
      value: value,
    );
  }

  String getVerificationCode() {
    if (pref.containsKey(PREF_VERIFICATION_CODE)) {
      return getpreference(PREF_VERIFICATION_CODE);
    } else {
      return '';
    }
  }

  void setUserData(List<String> value) {
    setpreference(type: DataType.LISTSTRING, key: PREF_USER_DATA, value: value);
  }

  List<String> getUserData() {
    if (pref.containsKey(PREF_USER_DATA)) {
      List<Object?> list = getpreference(PREF_USER_DATA);
      List<String> result = [];

      list.forEach((element) {
        result.add(element.toString());
      });
      return result;
    } else {
      return [];
    }
  }

  void setAppLnaguage(String code) {
    setpreference(type: DataType.STRING, key: PREF_APP_LANG, value: code);
  }

  String getAppLanguge() {
    if (pref.containsKey(PREF_APP_LANG)) {
      return getpreference(PREF_APP_LANG);
    } else {
      return 'ar';
    }
  }

  void setIsLogged(bool value) {
    setpreference(type: DataType.BOOL, key: PRF_IS_LOGGED, value: value);
  }

  bool getIsLoged() {
    if (pref.containsKey(PRF_IS_LOGGED)) {
      return getpreference(PRF_IS_LOGGED);
    } else {
      return false;
    }
  }

  void setGamesPlayedNum(int value) {
    int clac = getGamesPlayedNum() + value;
    setpreference(type: DataType.INT, key: PREF_GAMES_PLAYED_NUM, value: clac);
  }

  int getGamesPlayedNum() {
    if (pref.containsKey(PREF_GAMES_PLAYED_NUM)) {
      return getpreference(PREF_GAMES_PLAYED_NUM);
    } else {
      return 0;
    }
  }

  setpreference({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.INT:
        await prefs.setInt(key, value);
        break;
      case DataType.STRING:
        await prefs.setString(key, value);
        break;
      case DataType.BOOL:
        await prefs.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await prefs.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await prefs.setStringList(key, value);
        break;
    }
  }

  dynamic getpreference(String key) {
    return pref.get(key);
  }
}
//   //!--- get String from shared
  //   ////* getPrefrnce(PREF_TOKEN_INFO)
  //   //!--- String to json using jsonDecode
  //   ////*jsonDecode
  //   //!-- create token info mode from josn
  //   ////*TokenInfo.fromJson
  // }