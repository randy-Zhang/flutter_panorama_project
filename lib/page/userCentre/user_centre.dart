/*
 * @Author: zcw
 * @Date: 2022-08-31 16:20:26
 * @LastEditTime: 2022-09-07 18:06:57
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/page/userCentre/user_centre.dart
 */
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_panorama_app/common/values/values.dart';
import 'package:flutter_panorama_app/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UserCentrePage extends StatefulWidget {
  const UserCentrePage({Key? key}) : super(key: key);

  @override
  State<UserCentrePage> createState() => _UserCentrePageState();
}

class _UserCentrePageState extends State<UserCentrePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        SizedBox(
          height: 100,
        ),
        SizedBox(
          width: 200.w,
          height: 46.h,
          child: ElevatedButton(
            child: Text("登录"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  // side: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(23.h))),
            ),
            onPressed: () {
              context.pushNamed(MyRouter.loginPage);
            },
          ),
        ),
      ],
    ));
  }
}
