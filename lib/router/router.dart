/*
 * @Author: zcw
 * @Date: 2022-08-31 15:00:36
 * @LastEditTime: 2022-09-07 07:11:57
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_project/lib/router/router.dart
 */
import 'package:flutter/material.dart';
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
  GoRoute(
      path: MyRouter.applicationPage,
      builder: (context, state) {
        return const ApplicationPage();
      }),
  GoRoute(
      path: MyRouter.loginPage,
      name: MyRouter.loginPage,
      builder: (context, state) {
        return const LoginPage();
      }),
  GoRoute(
    path: "${MyRouter.registerPage}/:key/:state",
    name: MyRouter.registerPage,
    pageBuilder: (context, state) {
      // 传参
      Map<String, String>? params = state.params;

      debugPrint(params["state"].toString());
      debugPrint(state.queryParams.toString());
      debugPrint(state.extra.toString());

      // 模态弹出视图
      return MaterialPage(
          child: RegisterPage(params: params), fullscreenDialog: true);
      // Push
      // return const RegisterPage();
    },
  ),
]);
