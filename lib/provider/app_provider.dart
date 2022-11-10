import 'package:ecommerce/Apis/network_implementation/app/api_client/app_client.dart';
import 'package:ecommerce/Apis/network_implementation/app/api_client_factory.dart';

class AppProvider {
  static AppClient getAppAPI() {
    return ApiClientFactory.createAppClient();
  }
}
