/*
 * @Author: zcw
 * @Date: 2022-09-01 11:23:36
 * @LastEditTime: 2022-09-01 17:58:10
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/page/loginAndRegister/login.dart
 */
import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_panorama_app/common/values/values.dart';
import 'package:flutter_panorama_app/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 是否同意协议
  bool _acceptAgreement = false;
  late Timer _timer;
  int _countTime = 0;
  final _allTimeOfGetCode = 120;
  late TextEditingController _passwordController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();

    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
          left: 35.w,
          top: MediaQuery.of(context).padding.top,
          right: 35.w,
          bottom: MediaQuery.of(context).padding.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              width: 35.w,
              height: 35.w,
              child: Image.asset("assets/images/loginAndRegister/lr_back.png"),
            ),
            onTap: () {
              context.pop();
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 35.h, left: 13.w),
            child: Text(
              "使用验证码登录",
              style: TextStyle(
                fontSize: AppFont.bigFontSize.sp,
                color: AppColors.primaryText,
              ),
            ),
          ),
          // 输入框
          Container(
            margin: EdgeInsets.only(top: 89.h, left: 13.w),
            height: 133.h,
            child: Column(
              children: [
                // 手机号
                Container(
                  height: 41.h,
                  child: Row(
                    children: [
                      Container(
                        width: 72.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 235, 241, 255),
                          borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        ),
                        child: Center(
                          child: Text(
                            "+86",
                            style: TextStyle(
                              fontSize: AppFont.subFontSize.sp,
                              color: AppColors.primaryText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      Expanded(
                          child: TextField(
                            controller: _phoneNumberController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: AppFont.subFontSize.sp,
                          color: AppColors.primaryText,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "请输入手机号",
                          hintStyle: TextStyle(
                            fontSize: AppFont.subFontSize.sp,
                            color: AppColors.thirdElementText,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                const Divider(
                  height: 0.5,
                  color: AppColors.dividerElement,
                ),
                SizedBox(height: 18.h),
                // 验证码
                Container(
                  height: 41.h,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            controller: _passwordController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: AppFont.subFontSize.sp,
                          color: AppColors.primaryText,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "验证码",
                          hintStyle: TextStyle(
                            fontSize: AppFont.subFontSize.sp,
                            color: AppColors.thirdElementText,
                          ),
                        ),
                      ),),
                      SizedBox(
                        width: 80.w,
                        height: 20.h,
                        child: InkWell(
                          child: Text(
                            _countTime == 0
                                ? "获取验证码"
                                : "重新获取(${_countTime.toString()})",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.primaryElement,
                              fontSize: _countTime == 0
                                  ? AppFont.subFontSize
                                  : AppFont.explainFontSize,
                            ),
                          ),
                          onTap: () {
                            _getLoginCheckCode();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0.5,
                  color: AppColors.dividerElement,
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: Text(
                          "密码登录",
                          style: TextStyle(
                            fontSize: AppFont.smallFontSize.sp,
                            color: AppColors.primaryText,
                          ),
                        ),
                        onTap: () => debugPrint("密码登录"),
                      ),
                      InkWell(
                        child: Text("忘记密码?",
                            style: TextStyle(
                              fontSize: AppFont.smallFontSize.sp,
                              color: AppColors.secondaryElementText,
                            )),
                        onTap: () => debugPrint("忘记密码?"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          // 底部
          Container(
            height: 249.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20.h,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _acceptAgreement = !_acceptAgreement;
                          });
                        },
                        child: Row(
                          children: [
                            _acceptAgreement
                                ? Image.asset(
                                    "assets/images/loginAndRegister/lr_selected_selected.png")
                                : Image.asset(
                                    "assets/images/loginAndRegister/lr_selected_default.png"),
                            SizedBox(width: 8.w),
                            Text(
                              "我已阅读并同意",
                              style: TextStyle(
                                fontSize: AppFont.smallFontSize.sp,
                                color: AppColors.primaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: AppFont.smallFontSize.sp,
                          color: Color.fromARGB(255, 84, 144, 255),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "《用户协议》",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 84, 144, 255),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      debugPrint("《用户协议》");
                                    }),
                              TextSpan(
                                  text: "和",
                                  style: TextStyle(
                                    color: AppColors.primaryText,
                                  )),
                              TextSpan(
                                  text: "《隐私政策》",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 84, 144, 255),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      debugPrint("《隐私政策》");
                                    }),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.h),
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                      onPressed: () {
                        debugPrint("登录");
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r))),
                      ),
                      // ElevatedButton.styleFrom(
                      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.r))),
                      // ),
                      child: Text(
                        "登录",
                        style: TextStyle(
                          fontSize: AppFont.subFontSize.sp,
                          color: AppColors.primaryBackground,
                        ),
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 7.w,
                    top: 24.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        height: 0.5,
                        color: AppColors.dividerElement,
                      )),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: Text(
                          "第三方登录",
                          style: TextStyle(
                            color: AppColors.thirdElementText,
                            fontSize: AppFont.explainFontSize,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        height: 0.5,
                        color: AppColors.dividerElement,
                      )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.h),
                  child: Row(
                    children: [
                      Spacer(),
                      SizedBox(
                        width: 56.w,
                        height: 56.w,
                        child: InkWell(
                          child: Image.asset(
                            "assets/images/loginAndRegister/lr_wx_icon.png",
                            fit: BoxFit.contain,
                          ),
                          onTap: () {
                            debugPrint("wx login");
                          },
                        ),
                      ),
                      SizedBox(
                        width: 48.w,
                      ),
                      SizedBox(
                        width: 56.w,
                        height: 56.w,
                        child: InkWell(
                          child: Image.asset(
                            "assets/images/loginAndRegister/lr_apple_icon.png",
                            fit: BoxFit.contain,
                          ),
                          onTap: () {
                            debugPrint("Apple login");
                          },
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 28.h),
                  child: Center(
                    child: InkWell(
                      child: Text(
                        "没有账号? 点击这里",
                        style: TextStyle(
                          fontSize: AppFont.explainFontSize,
                          color: AppColors.primaryText,
                        ),
                      ),
                      onTap: () {
                        context.pushNamed(MyRouter.registerPage);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // color: Colors.purple,
    ));
  }

  _getLoginCheckCode() {
    if (_countTime > 0) {
      return;
    }

    //TODO: 接口请求
    _countTime = _allTimeOfGetCode;
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        _countTime--;
        if (_countTime == 0) {
          _timer.cancel();
        }
      });
      debugPrint("倒计时：${_countTime}");
    });
  }
}
