import 'package:dio/dio.dart';
import 'package:ecommerce/Apis/entity/product_list.dart';
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
  Future<CommonResponse<Product>> getProductDetails() =>
      requestCallWithDetails((_) => getApi().getProductDetails());

  // AppApiClient getApi() =>
  //     AppApiClient(_getAppDio(), baseUrl: APIConfig.demoApi);

  // @override
  // Future<CommonResponse<User>> getAppDetails() {
  //   return requestCallWithDetails((_) => getApi().getUsers(), "");
  // }
}
