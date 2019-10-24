import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _topHead(),
          _orderTitle(),
          _orderType(),
          _orderList(),
        ],
      ),
    );
  }

  Widget _topHead() {
    return Container(
      color: Colors.pinkAccent,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: CircleAvatar(
              radius: 56.0,
              backgroundImage: AssetImage('images/avator.png'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10, bottom: 30),
            child: Text(
              '待发货',
              textAlign: TextAlign.center,
              style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setSp(36)
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(
          width: 1,
          color: Colors.black12,
        )),
      ),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderType() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.party_mode,
                    size: 30,
                  ),
                  Text(
                    '待付款',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          //------------
          Expanded(
            child: Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.query_builder,
                    size: 30,
                  ),
                  Text(
                    '待发货',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          //------------
          Expanded(
            child: Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.directions_car,
                    size: 30,
                  ),
                  Text(
                    '待收货',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          //------------
          Expanded(
            child: Container(
              width: ScreenUtil().setWidth(187),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.content_paste,
                    size: 30,
                  ),
                  Text(
                    '待评价',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          //------------
        ],
      ),
    );
  }

  // 通用list title
  Widget _orderListTitle(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }

  Widget _orderList() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          _orderListTitle('领取优惠券'),
          _orderListTitle('已领取优惠券'),
          _orderListTitle('地址管理'),
          _orderListTitle('客服电话'),
          _orderListTitle('关于我们'),
        ],
      ),
    );
  }
}
