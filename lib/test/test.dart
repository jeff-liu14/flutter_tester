import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ace_bottom_navigation_bar/ace_bottom_navigation_bar.dart';

class TestMain extends StatelessWidget {
  final List<NavigationItemBean> bottomTabs = [
    NavigationItemBean(
        icon: CupertinoIcons.home,
        textStr: "首页",
        selected: null,
        textSelectedColor: Colors.black,
        isProtruding: null,
        type: null,
        textUnSelectedColor: Colors.grey,
        iconUnSelectedColor: Colors.grey,
        image: null,
        iconSelectedColor: Colors.black,
        imageSelected: null),
    NavigationItemBean(
        icon: CupertinoIcons.search,
        textStr: "分类",
        selected: null,
        textSelectedColor: Colors.black,
        isProtruding: null,
        type: null,
        textUnSelectedColor: Colors.grey,
        iconUnSelectedColor: Colors.grey,
        image: null,
        iconSelectedColor: Colors.black,
        imageSelected: null),
    NavigationItemBean(
        icon: CupertinoIcons.shopping_cart,
        textStr: "购物车",
        type: ACEBottomNavigationBarType.normal,
        selected: null,
        textSelectedColor: Colors.black,
        isProtruding: null,
        textUnSelectedColor: Colors.grey,
        iconUnSelectedColor: Colors.grey,
        image: null,
        iconSelectedColor: Colors.black,
        imageSelected: null),
    NavigationItemBean(
        icon: CupertinoIcons.profile_circled,
        textStr: "会员中心",
        selected: true,
        textSelectedColor: Colors.black,
        isProtruding: null,
        type: null,
        textUnSelectedColor: Colors.grey,
        iconUnSelectedColor: Colors.grey,
        image: null,
        iconSelectedColor: Colors.black,
        imageSelected: null),
    NavigationItemBean(
        icon: CupertinoIcons.profile_circled,
        textStr: "会员中心",
        selected: null,
        textSelectedColor: Colors.black,
        isProtruding: null,
        type: null,
        textUnSelectedColor: Colors.grey,
        iconUnSelectedColor: Colors.grey,
        image: null,
        iconSelectedColor: Colors.black,
        imageSelected: null)
  ];

  final List<Widget> tabBodies = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "测试",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: IndexedStack(
        index: 0,
        children: tabBodies,
      ),
      bottomNavigationBar: ACEBottomNavigationBar(
        items: bottomTabs,
        onTabChangedListener: (int position) {},
        type: ACEBottomNavigationBarType.normal,
      ),
    );
  }
}

class LinearLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: ListView(
        children: _list(),
      ),
    );
  }

  List<Widget> _list() {
    return <Widget>[
      // title
      Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Text(
          "LinearLayout",
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 18,
          ),
        ),
      ),
      _line(),
      // linearLayout width = 0 weight = 1
      _title("width = 0 weight = 1"),
      Container(
        height: 50,
        alignment: Alignment.center,
        child: Row(
          children: <Widget>[
            Expanded(
              child: _item(),
              flex: 1,
            ),
            Expanded(
              child: _item(isCenter: true),
              flex: 1,
            ),
            Expanded(
              child: _item(),
              flex: 1,
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.grey[300],
              width: 1,
            ),
          ),
        ),
      ),
      _line(),
      _title("orientation = horizo​​ntal | gravity = left"),
      _horizontalWidget(MainAxisAlignment.start),
      _line(),
      _title("orientation = horizo​​ntal | gravity = center"),
      _horizontalWidget(MainAxisAlignment.center),
      _line(),
      _title("orientation = horizo​​ntal | gravity = right"),
      _horizontalWidget(MainAxisAlignment.end),
      _line(),
      _title("orientation = vertical gravity = left"),
      _verticalWidget(CrossAxisAlignment.start),
      _line(),
      _title("orientation = vertical gravity = center"),
      _verticalWidget(CrossAxisAlignment.center),
      _line(),
      _title("orientation = vertical gravity = right"),
      _verticalWidget(CrossAxisAlignment.end),
      _line(),
      _space()
    ];
  }

  Widget _title(String title) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blueAccent,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _item({bool isCenter = false, bool hasAlignment = true}) {
    Alignment alignment;
    if (hasAlignment) {
      alignment = Alignment.center;
    }
    Decoration decoration;
    if (isCenter) {
      decoration = BoxDecoration(
          color: Colors.blueAccent,
          border: Border(
            left: BorderSide(
              width: 1,
              color: Colors.grey[300],
            ),
            right: BorderSide(
              width: 1,
              color: Colors.grey[300],
            ),
          ));
    }
    return Container(
      alignment: alignment,
      child: Text(
        "测试",
        style: TextStyle(
          color: Colors.redAccent,
        ),
      ),
      decoration: decoration,
    );
  }

  Widget _horizontalWidget(MainAxisAlignment mainAxisAlignment) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _item(),
          _item(isCenter: true),
          _item(),
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey[300],
            width: 1,
          ),
        ),
      ),
    );
  }

  Widget _verticalWidget(CrossAxisAlignment crossAxisAlignment) {
    return Container(
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _item(hasAlignment: false),
          Text(
            "测试",
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
          Text(
            "测试",
            style: TextStyle(
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(
          width: 1,
          color: Colors.grey[300],
        ),
      )),
    );
  }

  Widget _line() {
    return Container(
      height: 10,
      color: Colors.grey[300],
    );
  }

  Widget _space() {
    return Container(
      height: 100,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        _swipe(),
        _checkWidget(),
        _sendWidget(),
        _waitWidget(),
      ],
    );
  }

  Widget _swipe() {
    return Container(
      height: 180,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Image.network(
              "https://sr.aihuishou.com/cms/image/63689137818430153041559824.png",
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            builder: FractionPaginationBuilder(
                fontSize: 20,
                color: Colors.white,
                activeFontSize: 20,
                activeColor: Colors.white)),
        autoplay: true,
      ),
    );
  }

  Widget _checkWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "审核管理",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "全部",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.book,
                                color: Colors.redAccent[100],
                                size: 42,
                              ),
                              width: 35,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              margin: EdgeInsets.only(top: 2, bottom: 2),
                            ),
                            Positioned(
                                right: 10,
                                top: 0,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ))
                          ],
                        ),
                        width: 50,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "审核中",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.book,
                                color: Colors.redAccent[100],
                                size: 42,
                              ),
                              width: 35,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              margin: EdgeInsets.only(top: 4, bottom: 4),
                            ),
                            Positioned(
                                right: 10,
                                top: 0,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ))
                          ],
                        ),
                        width: 50,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "审核完成",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () {
                  Fluttertoast.showToast(
                    msg: "发货管理",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "发货管理",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "全部",
                          style: TextStyle(color: Colors.black54, fontSize: 12),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.grey,
                        )
                      ],
                    )
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.book,
                                color: Colors.redAccent[100],
                                size: 42,
                              ),
                              width: 35,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              margin: EdgeInsets.only(top: 2, bottom: 2),
                            ),
                            Positioned(
                                right: 10,
                                top: 0,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ))
                          ],
                        ),
                        width: 50,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "审核中",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "您有3个订单待发货，请尽快发货",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _waitWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 40),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "待确认订单",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              child: Icon(
                                Icons.book,
                                color: Colors.redAccent[100],
                                size: 42,
                              ),
                              width: 35,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              margin: EdgeInsets.only(top: 2, bottom: 2),
                            ),
                            Positioned(
                                right: 10,
                                top: 0,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
                                  child: Text(
                                    "4",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ))
                          ],
                        ),
                        width: 50,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "待确认",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "订单验货后有差异需确认，请尽快确认",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
