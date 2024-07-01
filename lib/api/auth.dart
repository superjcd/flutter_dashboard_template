import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard_template/router/router.dart';

import './base.dart';

class AuthApi {
  DioService client;
  AuthApi()
    :client =DioService(); 

  void login(Map<String, dynamic> data, BuildContext context) async {
    final resp = await client.post("/login", data:data);
    var respData = resp.data;
    var prefs = await SharedPreferences.getInstance();

    if (resp.statusCode == 200) {
       prefs.setString("token", respData["token"]);
       if (context.mounted) {
          const DashboardRoute().go(context);
       }
    }
  }

  void logout(BuildContext context) async {
    final resp = await client.post("/logout");
    var prefs = await SharedPreferences.getInstance();
    if (resp.statusCode == 200) {
       prefs.remove("token");
       if (context.mounted) {
          const LoginRoute().go(context);
       }
    }
  }
}