/*
 * @Author: zcw
 * @Date: 2022-08-31 16:19:02
 * @LastEditTime: 2022-09-16 17:53:37
 * @Description: In User Settings Edit
 * @FilePath: /flutter_panorama_app/lib/page/myWorks/my_works.dart
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
    return Scaffold(
      appBar: AppBar(
        title: Text("测试测试"),
      ),
      body: Container(
        child: ClipPath(
          clipper: MyClipper.create(context),
          child: Text(
              """上海合作组织成员国元首理事会第二十二次会议即将在乌兹别克斯坦撒马尔罕举行。各成员国有望利用撒马尔罕峰会契机，重点就系列关切事项交换意见，寻求共识和解决方案。

上合组织成员国始终遵循“上海精神”，坚持“走开放融通之路”，倡导创新、协调、绿色、开放、共享的发展理念，拓展务实合作空间，助力经济复苏、民生改善，推动区域经济合作取得累累硕果，向着“相互成就发展振兴的美好愿景”不断迈进，为全球发展繁荣贡献“上合力量”。

稳增长 提升互利合作水平

大家一起发展才是真发展，可持续发展才是好发展。当前，上合组织地区整体发展势头良好，成员国经济总量和对外贸易额实现年均增长约12%。2020年，成员国经济总量和对外贸易总额相较上合组织成立之初分别增长11倍和8倍。2021年，上合组织成员国经济总量超过20万亿美元，在全球经济中所占比重稳步增加，对世界经济增长的贡献率不断提升。

随着共建“一带一路”合作深入推进，上合组织国家发展战略对接合作日益紧密，贸易投资水平显著提升，地区高质量互联互通格局初现轮廓，农业、地方合作等领域亮点纷呈。乌兹别克斯坦的甜瓜、哈萨克斯坦的葵花子油、吉尔吉斯斯坦和塔吉克斯坦的车厘子等产品进入中国寻常百姓家；投资合作领域从石油、天然气、矿产资源开发等传统领域延伸至电力、电信、化工、农业、商贸服务业等；中欧班列2021年全年开行1.5万列，中俄黑河—布拉戈维申斯克公路桥实现通车，中吉乌铁路的建设进程已经开启……

俄罗斯卫星通讯社评价称，20多年来，上合组织成员国在贸易、投资、工程承包等领域取得了丰硕成果，加强了区域互联互通，促进了各国经济发展和民生改善。随着上合组织继续扩员，未来合作潜力巨大，前景可期。“上合组织驶入发展的快车道，‘上海精神’得到更多国家认同。”上合组织前秘书长阿利莫夫表示，上合组织地区传统能源储量丰富，水电、光伏等可再生能源发展迅速，种植业和畜牧业发达。上合组织加强合作，在全球可持续发展、保障能源安全和粮食安全方面发挥重要作用，为欧亚共同繁荣打下基础。

上合组织成员国以开放合作为导向，坚决维护多边贸易体制，推动共建“一带一路”倡议同成员国发展战略及欧亚经济联盟等区域合作倡议深入对接，畅通区域经济循环，为维护国际产业链供应链稳定、国际粮食安全和能源安全发出“上合声音”，展现“上合担当”。"""),
        ),
      ),
    );

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

class MyClipper extends CustomClipper<Path> {
  MyClipper.create(context) {
    this.context = context;
  }

  late BuildContext context;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(MediaQuery.of(context).size.width - 60, 0);
    path.lineTo(MediaQuery.of(context).size.width - 60, 120);
    path.lineTo(MediaQuery.of(context).size.width, 120);
    path.lineTo(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    path.lineTo(0, MediaQuery.of(context).size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
