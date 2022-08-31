/*
 * @Author: zcw
 * @Date: 2022-08-31 15:02:26
 * @LastEditTime: 2022-08-31 16:11:03
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/home/home_page.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        child: Text("Home Page"),
      ),
    );
  }
}