import 'package:dio/dio.dart';
import 'package:ecommerce/Apis/entity/product_list.dart';

import 'package:retrofit/retrofit.dart';

import '../../network/api_config.dart';
part 'app_api.g.dart';

@RestApi()
abstract class AppApis {
  factory AppApis(Dio dio, {String baseUrl}) = _AppApis;

  @GET(getProductList)
  Future<HttpResponse<Product>> getProductDetails();
}
