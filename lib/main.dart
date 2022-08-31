/*
 * @Author: zcw
 * @Date: 2022-08-31 11:47:50
 * @LastEditTime: 2022-08-31 16:13:58
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/main.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_panorama_app/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(MultiProvider(providers: [], child: const MyApp()));
  runApp(MyApp());
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
      builder: (BuildContext context, Widget? child) {
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