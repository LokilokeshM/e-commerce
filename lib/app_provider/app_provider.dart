import 'package:ecommerce/Apis/network_implementation/app/api_client/app_client.dart';
import '../Apis/network_implementation/app/api_client/api_client.dart';

class AppProvider {
  static AppClient getAppAPI() {
    return AppAPIClient();
  }
}
