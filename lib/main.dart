import 'package:flutter/material.dart';
import 'package:tasuke_ai/pages/auth/sign_in_page.dart';
import 'package:tasuke_ai/pages/auth/sign_up_page.dart';
import 'package:tasuke_ai/pages/home/home_page.dart';
import 'package:tasuke_ai/pages/setting/setting_page.dart';
import 'package:tasuke_ai/pages/setting/user_edit/user_edit_page.dart';
import 'package:tasuke_ai/pages/splash/splash_page.dart';
import 'package:tasuke_ai/pages/welcome/welcome_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => SplashPage(),
        '/welcome': (BuildContext context) => WelcomePage(),
        '/sign-up': (BuildContext context) => SignUpPage(),
        '/sign-in': (BuildContext context) => SignInPage(),
        '/home': (BuildContext context) => HomePage(),
        '/setting': (BuildContext context) => SettingPage(),
        '/setting/user-edit': (BuildContext context) => UserEditPage(),
      },
    ),
  );
}
