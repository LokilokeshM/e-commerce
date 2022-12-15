import 'package:dio/dio.dart';
import 'package:ecommerce/Apis/entity/prodcut_list_response.dart';
import 'package:ecommerce/Apis/entity_helper/add_product_request_body.dart'
    as r;
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
      // dio.options.headers['Content-Type'] = 'application/json';
      // dio.options.headers['X-Shopify-Access-Token'] = shopifyAccessToken;
      // dio.options.headers["Access-Control-Allow-Origin"] =
      //     "*"; // Required for CORS support to work
      // dio.options.headers["Access-Control-Allow-Credentials"] =
      //     true; // Required for cookies, authorization headers with HTTPS
      // dio.options.headers["Access-Control-Allow-Headers"] =
      //     "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
      // dio.options.headers["Access-Control-Allow-Methods"] =
      //     "POST, GET, OPTIONS, PUT, DELETE, HEAD";
      // final response = await dio.get(
      //     "https://aarkind-staging.myshopify.com/admin/api/2022-10/products.json");
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

  Future<void> addProduct(r.ProductRequest request) async {
    try {
      // r.ProductRequest(
      //     product: r.Product(
      //         title: "Sample Response",
      //         bodyHtml: "bodyHtml",
      //         vendor: "",
      //         productType: "Testing",
      //         tags: []))
      final commonResponse = await api.addProduct(request);
      if (commonResponse.error != null) {
        debugPrint(commonResponse.error.toString());
        return;
      }
      if (commonResponse.response != null) {
        debugPrint(commonResponse.response.toString());
        getProductList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateProduct(int id, r.ProductRequest request) async {
    try {
      final commonResponse = await api.updateProduct(id, request);
      if (commonResponse.error != null) {
        debugPrint(commonResponse.error.toString());
        return;
      }
      if (commonResponse.response != null) {
        debugPrint(commonResponse.response.toString());
        getProductList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      final commonResponse = await api.deleteProduct(id);
      if (commonResponse.error != null) {
        debugPrint(commonResponse.error.toString());
        return;
      }
      if (commonResponse.response != null) {
        debugPrint(commonResponse.response.toString());
        getProductList();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
