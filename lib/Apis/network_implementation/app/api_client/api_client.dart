import 'package:dio/dio.dart';
import 'package:ecommerce/Apis/entity/prodcut_list_response.dart' as p;
import 'package:ecommerce/Apis/entity/product_collect_list.dart';
import 'package:ecommerce/Apis/entity/product_image_list.dart';
import 'package:ecommerce/Apis/entity/product_list.dart';
import 'package:ecommerce/Apis/entity_helper/add_product_request_body.dart';
import 'package:ecommerce/Apis/network/api_basic.dart';
import 'package:ecommerce/Apis/network/api_config.dart';
import 'package:ecommerce/Apis/network/entity/common_response.dart';
import 'package:ecommerce/Apis/network_implementation/app/app_api.dart';
import 'app_client.dart';

class AppAPIClient extends AppClient with APIBasic {
  Dio _getAppDio() {
    final dio = getDio();
    return dio;
  }

  AppApis getApi() => AppApis(_getAppDio(), baseUrl: ApiAPIConfig.apiBaseUrl);

  //Example Code
  @override
  Future<CommonResponse<p.ProductListResponse>> getProductDetails() =>
      requestCallWithDetails((_) => getApi().getProductDetails());

  @override
  Future<CommonResponse<ProductCollectsList>> getCollectsListDetails(
          int productId) =>
      requestCallWithDetails((_) => getApi().getCollectsListDetails(productId));

  @override
  Future<CommonResponse<ProductImageList>> getProductImageList(int productId) =>
      requestCallWithDetails((_) => getApi().getProductImageList(productId));

  @override
  Future<CommonResponse<p.Product>> addProduct(
          ProductRequest addProductRequest) =>
      requestCallWithDetails((_) => getApi().addProduct(addProductRequest));

  @override
  Future<CommonResponse> deleteProduct(int id) =>
      requestCallWithDetails((_) => getApi().deleteProduct(id));

  @override
  Future<CommonResponse<p.Product>> updateProduct(
          int id, ProductRequest addProductRequest) =>
      requestCallWithDetails(
          (_) => getApi().updateProduct(id, addProductRequest));

  // AppApiClient getApi() =>
  //     AppApiClient(_getAppDio(), baseUrl: APIConfig.demoApi);

  // @override
  // Future<CommonResponse<User>> getAppDetails() {
  //   return requestCallWithDetails((_) => getApi().getUsers(), "");
  // }
}
