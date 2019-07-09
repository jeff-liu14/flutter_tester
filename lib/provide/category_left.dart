import 'package:flutter/material.dart';
import '../model/category.dart';
import 'package:provide/provide.dart';
import 'child_category.dart';
import 'dart:convert';
import '../service/service_method.dart';
import '../model/category_goodslist.dart';
import 'category_goods_list.dart';

class CategoryLeftProvide with ChangeNotifier {
  int currentIndex = 0;
  List<CategoryData> list = [];

  getCategoryData(List<CategoryData> data) {
    list = [];
    list.addAll(data);
    notifyListeners();
  }

  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

  mainChangeIndex(BuildContext context, String mallCategoryId) {
    int newIndex = 0;
    int index = 0;
    list.forEach((data) {
      if (data.mallCategoryId == mallCategoryId) {
        newIndex = index;
      }
      index++;
    });
    currentIndex = newIndex;
    var childList = list[currentIndex].bxMallSubDto;
    var categoryId = list[currentIndex].mallCategoryId;
    Provide.value<ChildCategory>(context)
        .getChildCategory(childList, categoryId);
    getGoodsList(context, categoryId);
    notifyListeners();
  }

  getGoodsList(BuildContext context, String categoryId) async {
    var data = {
      'categoryId': categoryId == null ? '4' : categoryId,
      'categorySubId': "",
      'page': 1,
    };
    await request('getMallGoods', formData: data).then((value) {
      var data = json.decode(value.toString());
      CategoryGoodsListModel goodsListModel =
          CategoryGoodsListModel.fromJson(data);
      Provide.value<CategoryGoodsListProvide>(context)
          .getGoodsList(goodsListModel.data);
    });
  }
}
