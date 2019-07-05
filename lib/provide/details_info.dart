import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo = null;

  // 从后台获取商品数据
  getGoodsInfo(String id) {
    var formData = {
      'goodId': id,
    };
    request('getGoodDetailById', formData: formData).then((data) {
      var responseData = json.decode(data.toString());
      print(responseData);
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }
}
