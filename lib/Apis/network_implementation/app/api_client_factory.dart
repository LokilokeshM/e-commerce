import 'api_client/api_client.dart';
import 'api_client/app_client.dart';

class ApiClientFactory {
  static AppClient createAppClient() {
    return AppAPIClient();
  }
}
