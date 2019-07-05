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
          var goodsInfo = data.goodsInfo.data.goodInfo;
          if (goodsInfo != null) {
            return Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  _goodsImage(goodsInfo.image1),
                  _goodsName(goodsInfo.goodsName),
                  _goodsNum(goodsInfo.goodsSerialNumber),
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
    );
  }

  // 商品名称
  Widget _goodsName(name) {
    return Container(
      height: ScreenUtil().setWidth(740),
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
          color: Colors.black12,
        ),
      ),
    );
  }
}
