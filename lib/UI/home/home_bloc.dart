import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/Apis/entity/product_collect_list.dart';
import 'package:ecommerce/Apis/entity/product_list.dart';
import 'package:ecommerce/Apis/network_implementation/app/api_client/app_client.dart';
import 'package:ecommerce/Bloc/bloc_provider.dart';
import 'package:ecommerce/model/produt.dart' as p;
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../../app_provider/app_provider.dart';

class HomeBloc extends BlocBase {
  AppClient get api => AppProvider.getAppAPI();

  Stream<List<p.Product?>> get productList => _productList.stream;
  final _productList = BehaviorSubject<List<p.Product?>>();
  Stream<List<Map<int, List<Collect>>>?> get collectList => _collectList.stream;
  final _collectList = BehaviorSubject<List<Map<int, List<Collect>>>?>();
  void init() {
    _initAsync();
  }

  void _initAsync() async {
    // getProductList();
  }

  // Future<void> getProductList() async {
  //   try {
  //     var commonResponse = await api.getProductDetails();
  //     if (commonResponse.error != null) {
  //       debugPrint(commonResponse.error.toString());
  //       return;
  //     }
  //     if (commonResponse.response!.payload.products != null) {
  //       debugPrint(commonResponse.response!.payload.products.toString());

  //       List<Product> productList = commonResponse.response!.payload.products!;
  //       List<p.Product> productModelList = [];
  //       List<Map<int, List<Collect>>>? collectList1;

  //       int index = 0;
  //       productList.forEach((element) async {
  //         debugPrint(element.toString());
  //         productModelList.add(p.Product(
  //           id: element.id ?? 0,
  //           images: [
  //             "assets/images/ps4_console_white_1.png",
  //             "assets/images/ps4_console_white_2.png",
  //             "assets/images/ps4_console_white_3.png",
  //             "assets/images/ps4_console_white_4.png",
  //           ],
  //           colors: [
  //             Color(0xFFF6625E),
  //             Color(0xFF836DB8),
  //             Color(0xFFDECB9C),
  //             Colors.white,
  //           ],
  //           title: element.title ?? "",
  //           price: 0.0,
  //           description: p.description,
  //           rating: 4.8,
  //           isFavourite: index % 2 == 0,
  //           isPopular: true,
  //         ));
  //         index += 1;
  //         final collect = await getVariantList(element.id ?? 0) ?? null;
  //         if (collect!.isNotEmpty) {
  //           collectList1!.add({element.id!: collect});
  //         }
  //       });

  //       _productList.sink.add(productModelList);
  //       _collectList.sink.add(collectList1);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  Future<List<String>> getImages(Product element) async {
    final result = await getImageList(element.id!);
    if (result!.isNotEmpty) {
      return result;
    }
    return [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ];
  }

  Future<List<Collect>?> getVariantList(int productId) async {
    try {
      final commonResponse = await api.getCollectsListDetails(productId);
      if (commonResponse.error != null) {
        debugPrint(commonResponse.error.toString());
        return null;
      }
      if (commonResponse.response!.payload!.collects != null) {
        return commonResponse.response!.payload!.collects;
      }
      return null;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<List<String>?> getImageList(int productId) async {
    try {
      final commonResponse = await api.getProductImageList(productId);
      if (commonResponse.error != null) {
        debugPrint(commonResponse.error.toString());
        return null;
      }
      if (commonResponse.response!.payload.images != null) {
        List<String> imageString = [];
        commonResponse.response!.payload.images!.forEach((element) {
          imageString.add(element.src!);
        });
        return imageString;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  void dispose() {
    _productList.close();
    _collectList.close();
  }
}
