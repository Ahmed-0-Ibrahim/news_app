import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
   static SharedPreferences? sharedPreferences;

  static CashHelper get()=>CashHelper();

   static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future setBoolData(String key,bool value) async{
   return await sharedPreferences!.setBool(key, value);
  }

  bool getData(String key) {
    return  sharedPreferences!.getBool(key)??false;
  }
}
