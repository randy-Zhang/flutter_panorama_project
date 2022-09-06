/*
 * @Author: zcw
 * @Date: 2022-08-31 16:19:42
 * @LastEditTime: 2022-09-06 11:26:58
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/page/panoramaManage/panorama_manage.dart
 */
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_panorama_app/common/values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ListShowType {
  ListShowType_List,
  ListShowType_Gird,
}

class PanoramaManagePage extends StatefulWidget {
  const PanoramaManagePage({Key? key}) : super(key: key);

  @override
  State<PanoramaManagePage> createState() => _PanoramaManagePageState();
}

class _PanoramaManagePageState extends State<PanoramaManagePage> {
  ListShowType _listShowType = ListShowType.ListShowType_List;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("全景管理"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 33.h,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          "时间排序",
                          style: TextStyle(
                              color: AppColors.thirdElementText,
                              fontSize: AppFont.explainFontSize),
                        ),
                        Image.asset(
                            "assets/images/panoramaManager/panorama_changeList_icon.png"),
                      ],
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Container(
                      height: 34.h,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 241, 245),
                        borderRadius: BorderRadius.all(Radius.circular(17.h)),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  InkWell(
                    onTap: () {
                      _listShowType == ListShowType.ListShowType_Gird
                          ? _listShowType = ListShowType.ListShowType_List
                          : _listShowType = ListShowType.ListShowType_Gird;
                      setState(() {});
                    },
                    child: Image.asset(
                        "assets/images/panoramaManager/panorama_changeList_icon.png"),
                  )
                ],
              ),
            ),
            Expanded(
              child: _listShowType == ListShowType.ListShowType_Gird
                  ? _createGirdList()
                  : _createListWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createGirdList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12.h,
        crossAxisCount: 2,
        crossAxisSpacing: 11.w,
        childAspectRatio: 166 / 149.0,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 245, 246, 250),
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 150 / 98,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.network(
                    "https://s2.loli.net/2022/09/05/lCpodvMyKUe8D1b.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "新建全景",
                    style: TextStyle(
                        fontSize: AppFont.smallFontSize,
                        color: AppColors.primaryText),
                  ),
                  SizedBox(
                    width: 50.w,
                    height: 20.h,
                    child: InkWell(
                      onTap: () {
                        debugPrint("点击Item");
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                            "assets/images/home/home_more_icon.png"),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _createListWidget() {
    return ListView.separated(
      itemCount: 50,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: AppColors.dividerElement, height: 0.5);
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 65,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                child: Image.network(
                  "https://s2.loli.net/2022/09/05/lCpodvMyKUe8D1b.png",
                  fit: BoxFit.cover,
                  width: 49,
                  height: 49,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "新建全景",
                      style: TextStyle(
                        fontSize: AppFont.contentFontSize,
                        color: AppColors.primaryText,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: DefaultTextStyle(
                      style: TextStyle(
                          fontSize: AppFont.explainFontSize,
                          color: AppColors.thirdElementText),
                      child: Row(
                        children: [
                          Text("2022-03-14 23:56:27"),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text("20M"),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text("4访问"),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
              SizedBox(width: 10),
              SizedBox(
                width: 50,
                child: InkWell(
                  onTap: () {},
                  child: Align(
                    alignment: FractionalOffset(1, 0.2),
                    child: Image.asset("assets/images/home/home_more_icon.png"),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
