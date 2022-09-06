/*
 * @Author: zcw
 * @Date: 2022-09-01 11:28:24
 * @LastEditTime: 2022-09-07 06:55:34
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_project/lib/page/loginAndRegister/register.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.params}) : super(key: key);

  final Map<String, String>? params;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 100),
      color: Colors.white,
      child: SizedBox(
        width: 200,
        height: 36,
        child:
            ElevatedButton(onPressed: () => context.pop(), child: Text("返回")),
      ),
    ));
  }
}
