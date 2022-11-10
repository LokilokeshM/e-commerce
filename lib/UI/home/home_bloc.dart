import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/Apis/network_implementation/app/api_client/app_client.dart';
import 'package:ecommerce/Bloc/bloc_provider.dart';
import 'package:ecommerce/model/produt.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../../provider/app_provider.dart';

class HomeBloc extends BlocBase {
  AppClient get api => AppProvider.getAppAPI();

  Stream<Product?> get productList => _productList.stream;
  final _productList = BehaviorSubject<Product?>();

  void init() {
    _initAsync();
  }

  void _initAsync() async {
    getProductList();
  }

  Future<void> getProductList() async {
    try {
      var commonResponse = await api.getProductDetails();
      if (commonResponse.response != null) {
        debugPrint(commonResponse.response.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    _productList.close();
  }
}
