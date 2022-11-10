import 'package:ecommerce/Apis/entity/product_list.dart';
import 'package:ecommerce/Apis/network/entity/common_response.dart';

import 'api_client.dart';

abstract class AppClient {
  Future<CommonResponse<Product>> getProductDetails();
}
