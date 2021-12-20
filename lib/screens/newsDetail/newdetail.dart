import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:newsflutter/Model/newsdetailmodel.dart';
import 'package:newsflutter/Network/rest_api.dart';
import 'package:newsflutter/Theme/colors.dart';
import 'package:newsflutter/Utils/constant.dart';
import 'package:newsflutter/Utils/widget.dart';


class NewDetail extends StatefulWidget {
  const NewDetail({Key? key}) : super(key: key);

  @override
  _NewDetailState createState() => _NewDetailState();
}

class _NewDetailState extends State<NewDetail> {
  //เรียกใช้งาน model
  NewsDetailModel? newDetailModel;

  // สร้างฟังก์ชันอ่านรายละเอียดข่าว
  readNewsDetail(id) async {
    try {
      var response = await CallAPI().getNewsDetail(id);
      setState(() {
        newDetailModel = response;
      });
    } catch (error) {
      print(error);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    //การรับค่าจาก arguments
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    //ทดสอบแสดงผล id ที่ได้มา
    // print(arguments['id'].toString());
    // ทดสอบเรียกฟังก์ชัน readNewsDetail
    inspect(readNewsDetail(arguments['id'].toString()));

    return Scaffold(
      body: newDetailModel != null ? NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: context.height() * 0.55,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: newDetailModel!.id!, 
                  child: cachedImage(newDetailModel!.embedded!.wpFeaturedmedia![0].sourceUrl.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
                collapseMode: CollapseMode.parallax,
                title: newDetailModel != null ?
                Text(
                  parseHTMLString(newDetailModel!.title!.rendered),
                  style: boldTextStyle(size: textSizeNormal, color: Theme.of(context).textTheme.headline6!.color),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ).visible(innerBoxIsScrolled).paddingOnly(left: isIos ? 16 : 0) : SizedBox(),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: BackButton(
                color: Colors.black,
                onPressed: () async {
                  finish(context);
                },
              ),
            )
          ];
        },
        body: newDetailModel != null ?
        Container(
          color: Theme.of(context).cardTheme.color,
          height: context.height(),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,
                  Text(
                    '${parseHTMLString(newDetailModel!.title!.rendered)}',
                    style: boldTextStyle(
                      size: textSizeLarge,
                      color: Theme.of(context).textTheme.headline6!.color,
                    ),
                    maxLines: 5,
                  ),
                  8.height,
                  Text(
                    '${'Author By ${parseHTMLString(newDetailModel!.embedded!.author![0].name)}'}',
                    style: primaryTextStyle(color: Colors.blue, size: 14),
                  ).visible(newDetailModel!.embedded!.author![0].name!.isNotEmpty),
                  10.height,
                  
                  Html(data: newDetailModel!.content!.rendered),
                  
                ],
              ),
            ),
          ),
        ): Padding(
          padding: const EdgeInsets.only(top:250.0),
          child: SizedBox(
            height: 200.0,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: new CircularProgressIndicator(
                      strokeWidth: 1,
                      color: primaryColor,
                      value: 1.0,
                    ),
                  ),
                ),
                Center(child: Text("กำลังโหลด...")),
              ],
            ),
          ),
        ),
      ) : Padding(
          padding: const EdgeInsets.only(top:250.0),
          child: SizedBox(
            height: 200.0,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: new CircularProgressIndicator(
                      strokeWidth: 1,
                      color: primaryColor,
                      value: 1.0,
                    ),
                  ),
                ),
                Center(child: Text("กำลังโหลด...")),
              ],
            ),
          ),
      ),
    );
  }

  String parseHTMLString(String? htmlString) {
    return parse(parse(htmlString).body!.text).documentElement!.text;
  }

}
