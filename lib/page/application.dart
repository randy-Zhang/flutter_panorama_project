/*
 * @Author: zcw
 * @Date: 2022-08-31 16:16:22
 * @LastEditTime: 2022-08-31 17:40:04
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/page/application.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_panorama_app/page/home/home_page.dart';
import 'package:flutter_panorama_app/page/myWorks/my_works.dart';
import 'package:flutter_panorama_app/page/panoramaManage/panorama_manage.dart';
import 'package:flutter_panorama_app/page/userCentre/user_centre.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/values/values.dart';


class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {

  int _currentPate = 0;

  final List<String> _tabTitles = [
    "首页",
    "全景管理",
    "我的作品",
    "个人中心",
  ];

  final List<Map<String, dynamic>> _tabs = [
    {"title": "首页", "icon": "assets/images/tab/tab_home_default.png", "selectedIcon": "assets/images/tab/tab_home_selected.png"},
    {"title": "全景管理", "icon": "assets/images/tab/tab_panoramaManage_default.png", "selectedIcon": "assets/images/tab/tab_panoramaManage_selected.png"},
    {"title": "我的作品", "icon": "assets/images/tab/tab_myWorks_default.png", "selectedIcon": "assets/images/tab/tab_myWorks_selected.png"},
    {"title": "个人中心", "icon": "assets/images/tab/tab_userCentre_default.png", "selectedIcon": "assets/images/tab/tab_userCentre_selected.png"},
  ];

  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // 顶部导航栏
  PreferredSizeWidget _buildAppBar() {
    return  AppBar(
        title: Text(
          _tabTitles[_currentPate],
          style: TextStyle(
            color: AppColors.primaryBackground,
            fontSize: AppFont.bigFontSize.sp,
            fontWeight: FontWeight.w600,
          ),
        ));
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        PanoramaManagePage(),
        MyWorksPage(),
        UserCentrePage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  //  底部导航
  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentPate,
      items: _createBottomItems(),
      onTap: (int index) {
        _handleNabBarTap(index);
      },
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.primaryElement,
      unselectedItemColor: AppColors.secondaryElement,
      selectedFontSize: AppFont.explainFontSize.sp,
      unselectedFontSize: AppFont.explainFontSize.sp,
      type: BottomNavigationBarType.fixed,
    );
  }

  // *********** UI 创建 ***********
  List<BottomNavigationBarItem> _createBottomItems() {
    final List<BottomNavigationBarItem> bottomTabs = _tabs.map((e) {
      return BottomNavigationBarItem(
        icon: Image.asset(e["icon"]),
        activeIcon: Image.asset(e["selectedIcon"]),
        label: e["title"],
        backgroundColor: AppColors.primaryBackground,
      );
    }).toList();
    return bottomTabs;
  }

  // *********** 事件 ***********
  // tab栏切换
  void _handleNabBarTap(int index) {
    _pageController.jumpToPage(index);
    // _pageController.animateToPage(index,
        // duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  // tab栏页码切换
  void _handlePageChanged(int index) {
    setState(() {
      _currentPate = index;
    });
  }

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}