import 'package:shared_preferences/shared_preferences.dart';
enum prefKeys{
  loggedIn,email
}
class SharedPrefController{
static  final SharedPrefController _instance =SharedPrefController._();
late SharedPreferences _sharedPreferences;

factory SharedPrefController (){
  return _instance;
}
SharedPrefController._();
Future<void> initPref() async{
  _sharedPreferences = await SharedPreferences.getInstance();
}
Future <void> save ({required String email}) async{
  await _sharedPreferences.setBool(prefKeys.loggedIn.toString(), true) ;
  await _sharedPreferences.setString(prefKeys.email.toString(), email);
}
bool  get LoggedIn=> _sharedPreferences.getBool(prefKeys.loggedIn.toString()) ?? false;
 String get email => _sharedPreferences.getString(prefKeys.email.toString() ) ?? '';
Future<bool> remove ({required String key}) async{
  if (_sharedPreferences.containsKey(key)){
    return await _sharedPreferences.remove(key);
  }
  return false;
  }
  Future<bool> removeEmail () async{
   return  await _sharedPreferences.remove(prefKeys.email.toString());
  }
  Future <bool> clear() async{
  return await _sharedPreferences.clear();
  }
}

// class Shape {
//   Shape shape = Shape();
//   factory(){
//     //return shape;
//     return Circle();
//   }
// }
//  class Circle extends Shape {
//
//  }