import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtils {
  static late final SharedPreferences sharedPreferences;

  static Future<SharedPreferences> init() async {
    return sharedPreferences= await SharedPreferences.getInstance();
  }

  // saveDate
static Future <dynamic> saveData({required String key , required dynamic value}) async {
    if(value is int){
      return await sharedPreferences.setInt(key, value);
    }else if(value is double){
      return await sharedPreferences.setDouble(key, value);
    }else if(value is String){
      return await sharedPreferences.setString(key, value);
    }else{
      return await sharedPreferences.setBool(key, value);
    }

}

// get Data
static Object? getData({required String key}){
  return  sharedPreferences.get(key);
}
static Future<bool>? removeData({required String key}) async {
    return await sharedPreferences.remove(key);
}

}