import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'router_handler.dart';

class Routers {
  static String root = '/';
  static String detailsPage = '/detail';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('error==========> page not found');
    });
    router.define(detailsPage, handler: detailsHandler);
  }
}
