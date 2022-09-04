/*
 * @Author: zcw
 * @Date: 2022-08-31 15:02:26
 * @LastEditTime: 2022-09-04 21:57:30
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_project/lib/page/home/home_page.dart
 */
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_panorama_app/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 24, right: 24, top: MediaQuery.of(context).padding.top),
      child: Column(
        children: [
          Container(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("assets/images/home/home_title.png"),
                InkWell(
                  onTap: () {
                    debugPrint("Home help");
                  },
                  child: Image.asset("assets/images/home/home_help.png"),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                      items: [1, 2, 3, 4, 5].map((e) {
                        return Builder(
                          builder: (context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.r)),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                "https://s2.loli.net/2022/09/04/F9gCsbuApjQJfO8.jpg",
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                        aspectRatio: 2 / 1,
                        viewportFraction: 1,
                        height: 108.h,
                        autoPlay: true,
                      )),
                  SizedBox(
                    height: 9.h,
                  ),
                  Column(children: _createLatelyOpen()),
                  SizedBox(height: 8),
                  _craateGroupTil("连接无人机"),
                  _createUavWidget(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 24.h),
            width: 305.w,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "开始飞行",
                style: TextStyle(
                  fontSize: AppFont.subFontSize,
                  color: AppColors.primaryElementText,
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.r)),
                primary: AppColors.primaryElement,
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _createLatelyOpen() {
    List<Widget> latelyOpenWidget = [];

    Widget topTil = _craateGroupTil("最近打开");

    for (var i = 0; i < 2; i++) {
      var til = Container(
        margin: EdgeInsets.only(top: 10.h, bottom: 4.h),
        height: 65,
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.dividerElement)),
        ),
        child: Row(
          children: [
            Container(
              width: 49.w,
              height: 49.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
              ),
              child: Image.network(
                "https://upload-images.jianshu.io/upload_images/5809200-a99419bb94924e6d.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                fit: BoxFit.cover,
              ),
              clipBehavior: Clip.antiAlias,
            ),
            SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "新建全景新建全景新建全景新建全景新建全景新建全景新建全景",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AppFont.subFontSize,
                      color: AppColors.primaryText,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: AppFont.explainFontSize,
                      color: AppColors.thirdElementText,
                    ),
                    child: Row(children: [
                      Text(
                        "2022-03-14 23:56:27",
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "20M",
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        "4访问",
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 36,
              child: InkWell(
                onTap: () {},
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child:
                          Image.asset("assets/images/home/home_more_icon.png")),
                ),
              ),
            ),
          ],
        ),
      );
      latelyOpenWidget.add(til);
    }

    latelyOpenWidget.insert(0, topTil);
    return latelyOpenWidget;
  }

  Widget _craateGroupTil(String title) {
    return Row(
      children: [
        Image.asset("assets/images/home//home_group_icon.png"),
        Text(
          title,
          style: TextStyle(
            fontSize: AppFont.secondFontSize,
            color: AppColors.primaryText,
          ),
        ),
        Spacer(),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Text(
                "更多",
                style: TextStyle(
                  fontSize: AppFont.subFontSize,
                  color: AppColors.secondaryElementText,
                ),
              ),
              Image.asset("assets/images/home/home_right_icon.png"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createUavWidget() {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      height: 166.h,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 242, 244, 250),
                borderRadius: BorderRadius.all(Radius.circular(6.r)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 13.h, bottom: 17.h),
                    child: Text(
                      "御 Mavic Air 2",
                      style: TextStyle(
                          fontSize: AppFont.subFontSize,
                          color: AppColors.primaryText),
                    ),
                  ),
                  Image.asset(
                    "assets/images/home/home_uav_icon.png",
                    width: 154.w,
                    height: 98.h,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Expanded(child: _createUavItemWidget("剩余电量", "70%")),
                  SizedBox(
                    height: 10.w,
                  ),
                  Expanded(child: _createUavItemWidget("可用内存", "26.5G")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createUavItemWidget(String title, String content) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 244, 250),
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: Text(
              title,
              style: TextStyle(
                fontSize: AppFont.contentFontSize,
                color: AppColors.primaryText,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Text(
              content,
              style: TextStyle(
                fontSize: AppFont.contentFontSize,
                color: AppColors.primaryElement,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
