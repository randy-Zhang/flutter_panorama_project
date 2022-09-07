/*
 * @Author: zcw
 * @Date: 2022-08-31 11:47:50
 * @LastEditTime: 2022-09-07 16:29:13
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/main.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_panorama_app/common/enitty/user_info.dart';
import 'package:flutter_panorama_app/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserInfo>(create: (_) => UserInfo()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // 设置大小适配
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, _) {
        // 路由设置
        return MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
          title: "Test",
        );
      },
    );
  }
}
