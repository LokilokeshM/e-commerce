import 'dart:io';

const int timeout = 60 * 1000;
String baseUrl =
    Platform.isAndroid ? "http://10.0.2.2:8080" : "http://127.0.0.1:8080";
const String items = "/items";
const String getProductList = "/getProductList";
const String getCollectionList = "/getCollectionList";
const String getCollectList = "/getCollectList";
const String getProductImageListString = "/getProductImageList";
const String updateProductImage = "/updateProductImage";

enum APIFlavor { dev, qa, stage, stageBlue, prod }

String apiFlavorString(APIFlavor value) {
  return value.toString().split('.').last;
}

class ApiAPIConfig {
  static late APIFlavor apiFlavor;

  static void init(APIFlavor flavor) {
    apiFlavor = flavor;
  }

  static String get apiBaseUrl {
    switch (apiFlavor) {
      case APIFlavor.dev:
        return baseUrl;
      default:
        return baseUrl;
    }
  }
}
