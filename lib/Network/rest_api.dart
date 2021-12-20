import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsflutter/Model/loginmodel.dart';
import 'package:newsflutter/Model/newsdetailmodel.dart';
import 'package:newsflutter/Model/newsmodel.dart';
import 'package:newsflutter/Utils/constant.dart';

class CallAPI {
  // กำหนด header ของ api
  _setHeader() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

  //กำหนด header สำหรับ Auth
  _setHeaderAuth() => {'Content-Type': 'application/x-www-form-urlencoded'};

  //Login Auth
  LoginCustomer(data) async {
    return await http.post(Uri.parse(baseAPIURL + 'jwt-auth/v1/token'),
        headers: _setHeaderAuth(), body: data);

    // if(response.statusCode == 200) {
    //   var jsonString = response.body;
    //   LoginModel loginModel = loginModelFromJson(jsonString);

    //   return loginModel.statusCode == 200 ? true : false;
    // }

    // return false;
  }

  //เขียน API อ่านข่าวล่าสุด
  Future<List<NewsModel>?> getLastNews() async {
    final response = await http.get(
        Uri.parse(baseAPIURL + 'wp/v2/posts?_embed&per_page=10'),
        headers: _setHeader());

    if (response.body.isNotEmpty) {
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  //เขียน API อ่านข่าวตามหมวดหมู่
  Future<List<NewsModel>?> getNewsByCategory(id) async {
    final response = await http.get(
        Uri.parse(baseAPIURL + 'wp/v2/posts?categories=$id&_embed'),
        headers: _setHeader());

    if (response.body.isNotEmpty) {
      return newsModelFromJson(response.body);
    } else {
      return null;
    }
  }

  //เขียน API อ่านรายละเอียดข่าว
  Future<NewsDetailModel?> getNewsDetail(id) async {
    final response = await http.get(
        Uri.parse(baseAPIURL + 'wp/v2/posts/$id?_embed'),
        headers: _setHeader());

    if (response.body.isNotEmpty) {
      return newsDetailModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
