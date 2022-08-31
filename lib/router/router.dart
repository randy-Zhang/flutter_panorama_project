/*
 * @Author: zcw
 * @Date: 2022-08-31 15:00:36
 * @LastEditTime: 2022-08-31 17:23:49
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/router/router.dart
 */
import 'package:flutter_panorama_app/page/application.dart';
import 'package:flutter_panorama_app/page/home/home_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {

  static const String applicationPage = "/";
}

final GoRouter router = GoRouter(routes: <GoRoute>[
  
  GoRoute(path: MyRouter.applicationPage, builder: (context, state) {
    return const ApplicationPage();
  }),
  GoRoute(path: "/home", builder: (context, state) {
    return const HomePage();
  })
]);