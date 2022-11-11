import 'package:dio/dio.dart';
import 'package:ecommerce/Apis/entity/product_collect_list.dart';
import 'package:ecommerce/Apis/entity/product_image_list.dart';
import 'package:ecommerce/Apis/entity/product_list.dart';

import 'package:retrofit/retrofit.dart';

import '../../network/api_config.dart';
part 'app_api.g.dart';

@RestApi()
abstract class AppApis {
  factory AppApis(Dio dio, {String baseUrl}) = _AppApis;

  @GET(getProductList)
  Future<HttpResponse<ProductList>> getProductDetails();

  @GET(getCollectList)
  Future<HttpResponse<ProductCollectsList>> getCollectsListDetails(
      @Query("product_id") int productId);

  @GET("$getProductImageListString/{product_id}/images.json?since_id=850703190")
  Future<HttpResponse<ProductImageList>> getProductImageList(
      @Path("product_id") int productId);
}
