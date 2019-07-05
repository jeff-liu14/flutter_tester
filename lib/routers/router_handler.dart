import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/details_page.dart';

var detailsHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String goodsId = params['id'].toString();
  print('id is : $goodsId');
  return DetailsPage(goodsId);
});
