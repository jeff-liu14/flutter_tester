import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'dart:convert';
import '../model/category.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/child_category.dart';
import '../model/category_goodslist.dart';
import '../provide/category_goods_list.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../routers/application.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('商品分类'),
          backgroundColor: Colors.pink,
        ),
        body: Container(
          child: Row(
            children: <Widget>[
              LeftCategoryNav(),
              Column(
                children: <Widget>[
                  RightCategoryNav(),
                  CategoryGoodsList(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// 左侧大类导航
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List<CategoryData> list = [];
  var listIndex = 0;

  @override
  void initState() {
    _getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(
        right: BorderSide(
          width: 1,
          color: Colors.black12,
        ),
      )),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _leftInkView(index);
        },
      ),
    );
  }

  Widget _leftInkView(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;
    return InkWell(
      onTap: () {
        setState(() {
          listIndex = index;
        });
        var childList = list[index].bxMallSubDto;
        var categoryId = list[index].mallCategoryId;
        Provide.value<ChildCategory>(context)
            .getChildCategory(childList, categoryId);
        _getGoodsList(categoryId: categoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isClick ? Color.fromRGBO(240, 240, 240, 1) : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  void _getCategory() async {
    await request('getCategory').then((value) {
      var data = json.decode(value.toString());
      CategoryModelResp categoryModelResp = CategoryModelResp.fromJsonMap(data);
      setState(() {
        list.addAll(categoryModelResp.data);
      });
      Provide.value<ChildCategory>(context)
          .getChildCategory(list[0].bxMallSubDto, list[0].mallCategoryId);
      _getGoodsList(categoryId: list[0].mallCategoryId);
    });
  }

  void _getGoodsList({String categoryId}) async {
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

// 右侧导航
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, childCategory) {
        return Container(
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.black12),
              )),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: childCategory.childCategoryList.length,
            itemBuilder: (context, index) {
              return _rightInkWell(
                  index, childCategory.childCategoryList[index]);
            },
          ),
        );
      },
    );
  }

  Widget _rightInkWell(int index, BxMallSubDto item) {
    bool isClick = false;
    isClick = (index == Provide.value<ChildCategory>(context).childIndex)
        ? true
        : false;
    return InkWell(
      onTap: () {
        Provide.value<ChildCategory>(context)
            .changeChildIndex(index, item.mallSubId);
        _getGoodsList(item.mallSubId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Center(
          child: Text(
            item.mallSubName,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: isClick ? Colors.pink : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _getGoodsList(String categorySubId) async {
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId': categorySubId,
      'page': 1,
    };
    await request('getMallGoods', formData: data).then((value) {
      var data = json.decode(value.toString());
      CategoryGoodsListModel goodsListModel =
          CategoryGoodsListModel.fromJson(data);
      if (goodsListModel.data == null) {
        Provide.value<CategoryGoodsListProvide>(context).getGoodsList([]);
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getGoodsList(goodsListModel.data);
      }
    });
  }
}

// 商品列表 上拉加载
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  GlobalKey<RefreshFooterState> _footerkey =
      new GlobalKey<RefreshFooterState>();

  var scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Provide<CategoryGoodsListProvide>(
      builder: (context, child, data) {
        try {
          if (Provide.value<ChildCategory>(context).page == 1) {
            // 列表位置，放到最上边
            scrollController.jumpTo(0.0);
          }
        } catch (e) {
          print('进入页面第一次初始化:${e}');
        }
        if (data.goodsList.length <= 0) {
          return Text('暂无数据');
        } else {
          return Expanded(
            child: Container(
                width: ScreenUtil().setWidth(570),
                child: EasyRefresh(
                  refreshFooter: ClassicsFooter(
                      key: _footerkey,
                      bgColor: Colors.white,
                      textColor: Colors.pink,
                      moreInfoColor: Colors.pink,
                      showMore: true,
                      noMoreText:
                          Provide.value<ChildCategory>(context).noMoreText,
                      moreInfo: '加载中',
                      loadReadyText: '上拉加载'),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: data.goodsList.length,
                    itemBuilder: (context, index) {
                      return _goodsItem(data.goodsList, index);
                    },
                  ),
                  loadMore: () async {
                    _getMoreList();
                  },
                )),
          );
        }
      },
    );
  }

  void _getMoreList() async {
    Provide.value<ChildCategory>(context).addPage();
    var data = {
      'categoryId': Provide.value<ChildCategory>(context).categoryId,
      'categorySubId': Provide.value<ChildCategory>(context).subId,
      'page': Provide.value<ChildCategory>(context).page,
    };
    await request('getMallGoods', formData: data).then((value) {
      var data = json.decode(value.toString());
      CategoryGoodsListModel goodsListModel =
          CategoryGoodsListModel.fromJson(data);
      if (goodsListModel.data == null) {
        Fluttertoast.showToast(
          msg: '已经到底了',
          toastLength: Toast.LENGTH_SHORT,
          textColor: Colors.white,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.pink,
          fontSize: 16,
        );
        Provide.value<ChildCategory>(context).changeNoMore('没有更多了');
      } else {
        Provide.value<CategoryGoodsListProvide>(context)
            .getMoreList(goodsListModel.data);
      }
    });
  }

  Widget _getGoodsImage(CategoryListData data, double width) {
    return Container(
      width: ScreenUtil().setWidth(width),
      child: Image.network(data.image),
    );
  }

  Widget _goodsName(CategoryListData data, double width) {
    return Container(
      padding: EdgeInsets.all(5),
      width: ScreenUtil().setWidth(width),
      child: Text(
        data.goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

  Widget _goodsPrice(CategoryListData data, double width) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: ScreenUtil().setWidth(width),
      child: Row(
        children: <Widget>[
          Text(
            '价格: ￥${data.presentPrice}',
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
          Text(
            '￥${data.oriPrice}',
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }

  Widget _goodsItem(List<CategoryListData> list, index) {
    return InkWell(
      onTap: () {
        Application.router
            .navigateTo(context, '/detail?id=${list[index].goodsId}');
      },
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 1,
              color: Colors.black12,
            ))),
        child: Row(
          children: <Widget>[
            _getGoodsImage(list[index], 200),
            Column(
              children: <Widget>[
                _goodsName(list[index], 370),
                _goodsPrice(list[index], 370),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
