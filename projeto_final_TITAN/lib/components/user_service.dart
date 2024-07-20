import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName') ?? 'NomeDeUsuário';
  }
}