import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/details_page.dart';

var detailsHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  var goodsId = params['id'][0];
  print('id is : $goodsId');
  return DetailsPage(goodsId);
});
