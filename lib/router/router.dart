/*
 * @Author: zcw
 * @Date: 2022-08-31 15:00:36
 * @LastEditTime: 2022-09-01 14:18:01
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/router/router.dart
 */
import 'package:flutter_panorama_app/page/application.dart';
import 'package:flutter_panorama_app/page/home/home_page.dart';
import 'package:flutter_panorama_app/page/loginAndRegister/login.dart';
import 'package:flutter_panorama_app/page/loginAndRegister/register.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  /// 主界面
  static const String applicationPage = "/";
  /// 登录
  static const String loginPage = "/login";
  /// 注册
  static const String registerPage = "/register";
}

final GoRouter router = GoRouter(routes: <GoRoute>[
  
  GoRoute(path: MyRouter.applicationPage, builder: (context, state) {
    return const ApplicationPage();
  }),
  GoRoute(path: MyRouter.loginPage, name: MyRouter.loginPage, builder: (context, state) {
    return const LoginPage();
  }),
  GoRoute(path: MyRouter.registerPage, name: MyRouter.registerPage, builder: (context, state) {
    return const RegisterPage();
  }),
]);