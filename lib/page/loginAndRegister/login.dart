/*
 * @Author: zcw
 * @Date: 2022-09-01 11:23:36
 * @LastEditTime: 2022-09-05 13:53:51
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

enum LoginType {
  /// 手机号登录
  loginTypePhoneNumber,

  /// 密码登录
  loginTypePassword,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 是否同意协议
  bool _acceptAgreement = false;
  bool _isShowPassword = true;
  late Timer _timer;
  int _countTime = 0;
  final _allTimeOfGetCode = 120;
  late TextEditingController _passwordController;
  late TextEditingController _checkCodeController;
  late TextEditingController _phoneNumberController;
  // 登录类型
  LoginType _loginType = LoginType.loginTypePhoneNumber;

  @override
  void initState() {
    super.initState();

    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _checkCodeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _passwordController.dispose();
    _phoneNumberController.dispose();
    _checkCodeController.dispose();
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
            // 返回按钮
            InkWell(
              child: SizedBox(
                width: 35.w,
                height: 35.w,
                child:
                    Image.asset("assets/images/loginAndRegister/lr_back.png"),
              ),
              onTap: () {
                context.pop();
              },
            ),
            // 顶部标题
            Container(
              margin: EdgeInsets.only(top: 35.h, left: 13.w),
              child: Text(
                _loginType == LoginType.loginTypePhoneNumber
                    ? "使用验证码登录"
                    : "使用密码登录",
                style: TextStyle(
                  fontSize: AppFont.bigFontSize.sp,
                  color: AppColors.primaryText,
                ),
              ),
            ),
            // 输入框
            _setupMiddleWidget(),
            const Spacer(),
            // 底部
            _setupBottomWidget(),
          ],
        ),
      ),
    );
  }

  /// **********************  事件  **********************
  _getLoginCheckCode() {
    if (_countTime > 0) {
      return;
    }

    //TODO: 接口请求
    _countTime = _allTimeOfGetCode;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        _countTime--;
        if (_countTime == 0) {
          _timer.cancel();
        }
      });
      debugPrint("倒计时：$_countTime");
    });
  }

  /// **********************  界面UI绘制  **********************
  // 中间输入框部分控件
  Widget _setupMiddleWidget() {
    return Container(
      margin: EdgeInsets.only(top: 89.h, left: 13.w),
      height: 133.h,
      child: Column(
        children: [
          Expanded(
            child: _loginType == LoginType.loginTypePassword
                ? _setupPasswordLoginWidget()
                : _setupCheckCodeLoginWidget(),
          ),
          Container(
            margin: EdgeInsets.only(top: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Text(
                    _loginType == LoginType.loginTypePhoneNumber
                        ? "密码登录"
                        : "验证码登录",
                    style: TextStyle(
                      fontSize: AppFont.smallFontSize.sp,
                      color: AppColors.primaryText,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (_loginType == LoginType.loginTypePhoneNumber) {
                        _loginType = LoginType.loginTypePassword;
                      } else {
                        _loginType = LoginType.loginTypePhoneNumber;
                      }
                    });
                    _passwordController.text = "";
                    _checkCodeController.text = "";
                  },
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
    );
  }

  // 验证码登录部分Widget
  Widget _setupCheckCodeLoginWidget() {
    return Column(
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
              SizedBox(
                width: 12.w,
              ),
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
                  controller: _checkCodeController,
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
                ),
              ),
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
      ],
    );
  }

  // 密码登录部分Widget
  Widget _setupPasswordLoginWidget() {
    return Column(
      children: [
        // 手机号
        SizedBox(
          height: 41.h,
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
          ),
        ),
        const Divider(
          height: 0.5,
          color: AppColors.dividerElement,
        ),
        SizedBox(height: 18.h),
        // 密码
        SizedBox(
          height: 41.h,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.number,
                  obscureText: _isShowPassword,
                  style: TextStyle(
                    fontSize: AppFont.subFontSize.sp,
                    color: AppColors.primaryText,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "密码",
                    hintStyle: TextStyle(
                      fontSize: AppFont.subFontSize.sp,
                      color: AppColors.thirdElementText,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 40.w,
                height: 20.h,
                child: InkWell(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(_isShowPassword == true
                        ? "assets/images/loginAndRegister/lr_showPassword_close.png"
                        : "assets/images/loginAndRegister/lr_showPassword_close.png"),
                  ),
                  onTap: () {
                    setState(() {
                      _isShowPassword = !_isShowPassword;
                    });
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
      ],
    );
  }

  // 底部控件布局
  Widget _setupBottomWidget() {
    return SizedBox(
      height: 249.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
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
                            style: const TextStyle(
                              color: Color.fromARGB(255, 84, 144, 255),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                debugPrint("《用户协议》");
                              }),
                        const TextSpan(
                            text: "和",
                            style: TextStyle(
                              color: AppColors.primaryText,
                            )),
                        TextSpan(
                            text: "《隐私政策》",
                            style: const TextStyle(
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
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.r))),
                ),
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
    );
  }
}
