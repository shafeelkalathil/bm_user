import 'package:shared_preferences/shared_preferences.dart';

class HomeRepository {
  Future<bool> checkUserIsLoggedIn() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    var isLoggedIn = storage.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }
}
