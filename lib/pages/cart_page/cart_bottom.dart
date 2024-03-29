import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../provide/cart.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.white,
      child: Provide<CartProvide>(
        builder: (context, child, val) {
          return Container(
            width: ScreenUtil().setWidth(750),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _selectAllBtn(context),
                _allPriceArea(context),
                _goButton(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _selectAllBtn(BuildContext context) {
    bool isAllCheck = Provide.value<CartProvide>(context).isAllCheck;
    return Container(
      alignment: Alignment.centerLeft,
//      width: ScreenUtil().setWidth(160),
      child: Row(
        children: <Widget>[
          Checkbox(
            activeColor: Colors.pink,
            value: isAllCheck,
            onChanged: (bool val) {
              Provide.value<CartProvide>(context).changeAllCheckBtnState(val);
            },
          ),
          Text('全选'),
        ],
      ),
    );
  }

  Widget _allPriceArea(BuildContext context) {
    double allPrice = Provide.value<CartProvide>(context).allPrice;
    return Container(
//      width: ScreenUtil().setWidth(400),
    alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '合计: ',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(34),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '￥${allPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: ScreenUtil().setSp(34),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '满10元免配送费，预购免配送费',
              style: TextStyle(
                color: Colors.black38,
                fontSize: ScreenUtil().setSp(22),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _goButton(BuildContext context) {
    int allGoodsCount = Provide.value<CartProvide>(context).allGoodsCount;
    return Container(
      alignment: Alignment.centerRight,
//      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(3.0),
          ),
          child: Text(
            '结算(${allGoodsCount})',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
