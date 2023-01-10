import 'package:dio/dio.dart';
import 'package:ecommerce/Apis/entity/count_entity.dart';
import 'package:ecommerce/Apis/entity/prodcut_list_response.dart' as p;
import 'package:ecommerce/Apis/entity/product_collect_list.dart';
import 'package:ecommerce/Apis/entity/product_image_list.dart';
import 'package:ecommerce/Apis/entity_helper/add_product_request_body.dart';
import 'package:retrofit/retrofit.dart';

import '../../entity/order_list_response.dart';
import '../../network/api_config.dart';
part 'app_api.g.dart';

@RestApi()
abstract class AppApis {
  factory AppApis(Dio dio, {String baseUrl}) = _AppApis;

  @GET(listProductApi)
  Future<HttpResponse<p.ProductListResponse>> getProductDetails();

  @GET(getCollectList)
  Future<HttpResponse<ProductCollectsList>> getCollectsListDetails(
      @Query("product_id") int productId);

  @GET("$getProductImageListString/{product_id}/images.json?since_id=850703190")
  Future<HttpResponse<ProductImageList>> getProductImageList(
      @Path("product_id") int productId);

  @POST(listProductApi)
  Future<HttpResponse<p.Product>> addProduct(
      @Body() ProductRequest addProductRequest);

  @DELETE("/products/{id}.json")
  Future<HttpResponse> deleteProduct(@Path() int id);

  @PUT("/products/{id}.json")
  Future<HttpResponse<p.Product>> updateProduct(
      @Path() int id, @Body() ProductRequest addProductRequest);

  @GET("/orders.json")
  Future<HttpResponse<OrderList>> getOrderListStatus(
      {@Query("status") String status = "any"});
  @GET("/orders.json")
  Future<HttpResponse<OrderList>> getOrderListFinancialStatus(
      {@Query("financial_status") String financialStatus = "any"});

  @GET("/customers/$countJson")
  Future<HttpResponse<CountEntity>> getCustomerCount();

  @GET("/orders/$countJson")
  Future<HttpResponse<CountEntity>> getOrderCount();

  @GET("/products/$countJson")
  Future<HttpResponse<CountEntity>> getProductCount();
}
