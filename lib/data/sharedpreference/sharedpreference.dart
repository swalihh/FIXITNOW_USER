
import 'package:shared_preferences/shared_preferences.dart';

class Sharedprfe{
  Sharedprfe._();
 static final _instance= Sharedprfe._();
 static Sharedprfe get instance => _instance;


static late final SharedPreferences prefs;

Future<void> init() async{
  prefs =await SharedPreferences.getInstance();
}

storage(int id)async{
   await prefs.setInt("data", id);
}
getstorage(){
  var id=  prefs.getInt("data");
   print('in storage $id');
  return id;

}
removerId(){
  prefs.remove('data');
}

}