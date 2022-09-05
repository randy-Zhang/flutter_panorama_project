/*
 * @Author: zcw
 * @Date: 2022-08-31 16:19:02
 * @LastEditTime: 2022-09-05 22:53:46
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_project/lib/page/myWorks/my_works.dart
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyWorksPage extends StatefulWidget {
  const MyWorksPage({Key? key}) : super(key: key);

  @override
  State<MyWorksPage> createState() => _MyWorksPageState();
}

class _MyWorksPageState extends State<MyWorksPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                // title: Text("NestedScrollView"),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://s2.loli.net/2022/09/05/lCpodvMyKUe8D1b.png",
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: 180.h, // 展开是的高度
                // pinned: true, // 是否固定在顶部
                floating: true, // 是否漂浮
                snap: true,
                forceElevated: innerBoxIsScrolled, // 是否一直显示阴影
              ),
            ),
            // _buildSliverList(5),
          ];
        },
        body: Builder(builder: (context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              _buildSliverList(15),
              // ListView.builder(
              //   padding: EdgeInsets.all(8),
              //   physics: ClampingScrollPhysics(),
              //   itemCount: 36,
              //   itemBuilder: (context, index) {
              //     return SizedBox(
              //       height: 50,
              //       child: Center(
              //         child: Text("Item $index"),
              //       ),
              //     );
              //   },
              // )
            ],
          );
        }),
      ),
    );
  }

  Widget _buildSliverList(int count) {
    return SliverFixedExtentList(
        delegate: SliverChildBuilderDelegate((_, index) {
          return ListTile(
            title: Text("Sliver item $index"),
          );
        }, childCount: count),
        itemExtent: 56);
  }
}
