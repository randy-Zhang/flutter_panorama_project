/*
 * @Author: zcw
 * @Date: 2022-08-31 16:20:26
 * @LastEditTime: 2022-09-01 14:52:02
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/page/userCentre/user_centre.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_panorama_app/router/router.dart';
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
      child: ElevatedButton(
        child: Text("登录"),
        onPressed: () {
          context.pushNamed(MyRouter.loginPage);
        },
      ),
    );
  }
}
