import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static final shared = LocalService();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String _userId = "@user_id";

  Future<String> getUserId() async {
    final SharedPreferences prefs = await _prefs;
    var status = prefs.getString(_userId);
    return status;
  }

  void setUserId(String userId) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(_userId, userId);
  }

  void removeUserId() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(_userId);
  }
}
