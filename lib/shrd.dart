import 'package:shared_preferences/shared_preferences.dart';
setShared(String value)async{
  SharedPreferences set=await SharedPreferences.getInstance();
  set.setString("token", value);
}

 getShared()async{
  SharedPreferences set=await SharedPreferences.getInstance();
   String? token= set.getString("token");
  return token;
}
deletShared()async {
  SharedPreferences set=await SharedPreferences.getInstance();
  set.remove("token");
}

  
