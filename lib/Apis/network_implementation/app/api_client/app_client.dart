import 'package:ecommerce/Apis/entity/prodcut_list_response.dart';
import 'package:ecommerce/Apis/entity/product_collect_list.dart';
import 'package:ecommerce/Apis/entity/product_image_list.dart';
import 'package:ecommerce/Apis/network/entity/common_response.dart';

import 'api_client.dart';

abstract class AppClient {
  Future<CommonResponse<ProductListResponse>> getProductDetails();
  Future<CommonResponse<ProductCollectsList>> getCollectsListDetails(
      int productId);
  Future<CommonResponse<ProductImageList>> getProductImageList(int productId);
}
