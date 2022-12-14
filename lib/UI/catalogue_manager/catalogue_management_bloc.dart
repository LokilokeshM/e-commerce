import 'package:dio/dio.dart';
import 'package:ecommerce/Apis/entity/prodcut_list_response.dart';
import 'package:ecommerce/Apis/network/api_config.dart';
import 'package:ecommerce/Apis/network_implementation/app/api_client/app_client.dart';
import 'package:ecommerce/Bloc/bloc_provider.dart';
import 'package:ecommerce/app_provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class CatalogueManagementBloc extends BlocBase {
  AppClient get api => AppProvider.getAppAPI();

  Stream<List<Product>?> get productList => _productList.stream;
  final _productList = BehaviorSubject<List<Product>?>();

  void init() {
    getProductList();
  }

  Future<void> getProductList() async {
    try {
      // Dio dio = new Dio();
      // dio.options.headers['content-Type'] = 'application/json';
      // dio.options.headers["authorization"] = shopifyAccessToken;
      // final response = await dio.get("https://gorest.co.in/public-api/users");
      // debugPrint(response.data.toString());
      var commonResponse = await api.getProductDetails();
      if (commonResponse.error != null) {
        debugPrint(commonResponse.error.toString());
        return;
      }
      if (commonResponse.response!.products != null) {
        debugPrint(commonResponse.response!.products.toString());

        _productList.add(commonResponse.response!.products);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    _productList.close();
  }
}
