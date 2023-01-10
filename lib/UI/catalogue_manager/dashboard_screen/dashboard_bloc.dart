import 'dart:ui';

import 'package:ecommerce/Apis/network/entity/common_response.dart';
import 'package:ecommerce/Apis/network_implementation/app/api_client/app_client.dart';
import 'package:ecommerce/Bloc/bloc_provider.dart';
import 'package:ecommerce/app_provider/app_provider.dart';
import 'package:ecommerce/model/MyFiles.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:ecommerce/Apis/entity/prodcut_list_response.dart';

import '../../../constant/constant.dart';
import 'components/top_selling_info_card.dart';

// TopSellingInfoCard(
//             imageSrc:
//                 "https://cdn.shopify.com/s/files/1/0565/1903/2987/products/9.webp?v=1672725894",
//             title: "FIX MY CURLS",
//             orderCount: 1,
//             price: 1328,
//           ),
//           TopSellingInfoCard(
//             imageSrc:
//                 "https://cdn.shopify.com/s/files/1/0565/1903/2987/products/8_e0f3baf4-60b7-4549-ada4-13241370149a.webp?v=1672725925",
//             title: "DETOXIE",
//             orderCount: 15,
//             price: 1328,
//           ),
//           TopSellingInfoCard(
//             imageSrc:
//                 "https://cdn.shopify.com/s/files/1/0565/1903/2987/products/7_227d623c-e01a-4598-923f-cbdcc1abb077.webp?v=1672725962",
//             title: "FIZZY FERN",
//             orderCount: 50,
//             price: 1328,
//           ),
//           TopSellingInfoCard(
//             imageSrc:
//                 "https://cdn.shopify.com/s/files/1/0565/1903/2987/products/6_0490d6eb-7aa5-4e5d-a31f-1652bdbb2460.webp?v=1672725989",
//             title: "EARTHI",
//             orderCount: 50,
//             price: 140,
//           ),
class DashboardBloc extends BlocBase {
  Stream<List<TopListTabCardHelper>?> get topBoxList => _topBoxList.stream;
  final _topBoxList = BehaviorSubject<List<TopListTabCardHelper>?>();

  Stream<List<TopSellingInfo>?> get topSellingInfoCardInfo =>
      _topSellingInfoCardInfo.stream;
  final _topSellingInfoCardInfo = BehaviorSubject<List<TopSellingInfo>?>();

  AppClient get api => AppProvider.getAppAPI();
  List<TopSellingInfo> topSelling = [];
  List<TopListTabCardHelper> topListTabs = [
    TopListTabCardHelper(
      title: "AArdae",
      svgSrc: "assets/icons/Documents.svg",
      color: primaryColor,
      level: 3,
      rank: 97,
    ),
    TopListTabCardHelper(
      title: "Users",
      svgSrc: "assets/icons/google_drive.svg",
      color: Color(0xFFFFA113),
    ),
    TopListTabCardHelper(
      title: "Total Orders",
      svgSrc: "assets/icons/one_drive.svg",
      color: Color(0xFFA4CDFF),
    ),
    TopListTabCardHelper(
      title: "Total Products",
      svgSrc: "assets/icons/drop_box.svg",
      color: Color(0xFF007EE5),
    ),
  ];
  void init() {
    initAsync();
    getProductList();
  }

  void initAsync() async {
    await getCustomerCount();
    await getOrderCount();
    await getProductCount();
    _topBoxList.sink.add(topListTabs);
  }

  @override
  void dispose() {
    _topBoxList.close();
    _topSellingInfoCardInfo.close();
  }

  Future<void> getCustomerCount() async {
    try {
      final commonResponse = await api.getCustomerCount();
      if (commonResponse.error != null) {
        print(commonResponse.error.toString());
      }
      if (commonResponse.response != null) {
        topListTabs[1].totalCount = commonResponse.response!.count ?? 0;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getOrderCount() async {
    try {
      final commonResponse = await api.getOrderCount();
      if (commonResponse.error != null) {
        print(commonResponse.error.toString());
      }
      if (commonResponse.response != null) {
        topListTabs[2].totalCount = commonResponse.response!.count ?? 0;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getProductCount() async {
    try {
      final commonResponse = await api.getOrderCount();
      if (commonResponse.error != null) {
        print(commonResponse.error.toString());
      }
      if (commonResponse.response != null) {
        topListTabs[3].totalCount = commonResponse.response!.count ?? 0;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getProductList() async {
    try {
      var commonResponse = await api.getProductDetails();
      if (commonResponse.error != null) {
        debugPrint(commonResponse.error.toString());
        return;
      }
      if (commonResponse.response!.products != null) {
        debugPrint(commonResponse.response!.products.toString());
        List<Product>? products = commonResponse.response!.products;

        for (var element in commonResponse.response!.products!) {
          topSelling.add(
            TopSellingInfo(
              imageSrc: element.image != null
                  ? element.image!.src ??
                      "https://cdn.shopify.com/s/files/1/0565/1903/2987/products/6_0490d6eb-7aa5-4e5d-a31f-1652bdbb2460.webp?v=1672725989"
                  : "https://cdn.shopify.com/s/files/1/0565/1903/2987/products/6_0490d6eb-7aa5-4e5d-a31f-1652bdbb2460.webp?v=1672725989",
              title: element.title ?? "",
              orderCount: 50,
              price: element.variants != null
                  ? element.variants!.first.price ?? ""
                  : "",
            ),
          );
          if (topSelling.length == 5) break;
        }
        _topSellingInfoCardInfo.sink.add(topSelling);
        // _productList.add(commonResponse.response!.products);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
