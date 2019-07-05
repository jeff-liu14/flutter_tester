import 'package:flutter/material.dart';
import '../model/category.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0; // 子类高亮索引
  String categoryId = '4'; // 大类ID
  String subId = ''; // 小类
  int page = 1; // 列表页数
  String noMoreText = ''; // 显示数据为空的文字

  // 大类切换逻辑
  getChildCategory(List<BxMallSubDto> list, String id) {
    page = 1;
    noMoreText = '';
    childIndex = 0;
    categoryId = id;
    BxMallSubDto bxMallSubDto = BxMallSubDto();
    bxMallSubDto.mallSubId = '';
    bxMallSubDto.mallCategoryId = '';
    bxMallSubDto.comments = 'null';
    bxMallSubDto.mallSubName = '全部';
    childCategoryList = [bxMallSubDto];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  // 改变子类索引
  changeChildIndex(index, String id) {
    page = 1;
    noMoreText = '';
    childIndex = index;
    subId = id;
    notifyListeners();
  }

  // 增加page
  addPage() {
    page++;
  }

  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
