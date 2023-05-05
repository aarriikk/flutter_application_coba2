import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/screens/auth/login.dart';
import 'package:my_app/screens/layout.dart';
import 'package:my_app/utils/constant.dart';
import 'package:my_app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // service untuk register
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
          Uri.parse('${Constants.uri}/auth/signup'),
          body: jsonEncode({
            'email': email,
            'password': password
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Account created!');
          });
    } catch (err) {
      print(err);
      showSnackBar(context, err.toString());
    }
  }

  // service untuk login
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);

      http.Response res = await http.post(
          Uri.parse('${Constants.uri}/auth/signin'),
          body: jsonEncode({
            'email': email,
            'password': password,
          }),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            var jsonResponse = jsonDecode(res.body)['data'];
            userProvider.setUser(jsonEncode(jsonResponse));
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['data']['token']);
            navigator.pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LayoutPage()),
                (route) => false);
          });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  // service untuk get user data
  void getUserData(BuildContext context) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      http.Response res = await http.get(
        Uri.parse('${Constants.uri}/auth/getMe'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            userProvider.setUser(res.body);
          });
    } catch (err) {
      showSnackBar(context, err.toString());
    }
  }

  // service untuk logout
  void signOutUser(BuildContext context) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('x-auth-token', '');
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }
}
