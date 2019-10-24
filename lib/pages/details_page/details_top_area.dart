import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context, child, data) {
        if (data != null) {
          var goodsInfo = Provide.value<DetailsInfoProvide>(context)
              .goodsInfo
              .data
              .goodInfo;
          if (goodsInfo != null) {
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  _goodsImage(goodsInfo.image1),
                  _goodsName(goodsInfo.goodsName),
                  _goodsNum(goodsInfo.goodsSerialNumber),
                  _goodsPrice(goodsInfo.presentPrice, goodsInfo.oriPrice),
                ],
              ),
            );
          } else {
            return Text('加载中');
          }
        } else {
          return Text('加载中');
        }
      },
    );
  }

  // 商品图片
  Widget _goodsImage(url) {
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
      height: ScreenUtil().setHeight(600),
    );
  }

  // 商品名称
  Widget _goodsName(name) {
    return Container(
      alignment: Alignment.topLeft,
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15),
      child: Text(
        name,
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  // 商品标号
  Widget _goodsNum(num) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      margin: EdgeInsets.only(
        top: 8,
      ),
      child: Text(
        '编号: $num',
        style: TextStyle(
          color: Colors.black38,
        ),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(double price, double oriPrice) {
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
        bottom: 5,
      ),
      margin: EdgeInsets.only(
        top: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '￥$price',
            style: TextStyle(
              color: Colors.red,
              fontSize: ScreenUtil().setSp(36),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
          ),
          Text(
            '市场价: ',
            style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(26),
            ),
          ),
          Text(
            '￥$oriPrice',
            style: TextStyle(
              color: Colors.black26,
              fontSize: ScreenUtil().setSp(26),
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
