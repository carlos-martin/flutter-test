import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

const String URL = 'url';
const String FIRSTACCESS = 'firstAccess';

Future<bool> saveUrlPreference(String url) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(URL, url);
  return prefs.commit();
}

Future<String> getUrlPreference() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = prefs.getString(URL);
  return url;
}