import 'package:dio/dio.dart';
import 'package:ecommerce/common/api_config.dart';
import 'package:ecommerce/model/items_list.dart';
import 'package:retrofit/http.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: ApiConfig.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(ApiConfig.items)
  Future<ItemList> getItems();
}
