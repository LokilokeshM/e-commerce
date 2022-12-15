// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart' as retrofit;
import 'package:uuid/uuid.dart';

// Project imports:
import '../../common/global.dart';

import 'api_config.dart';
import 'entity/common_response.dart';
import 'entity/error_entity.dart';

typedef Future<T> ApiCall<T>();
typedef Future<T> ApiCallCorrelated<T>(String correlationId);

const String noNetworkMsg =
    'Please make sure your device is connected to the internet.\n Go to your device Settings to enable Wi-Fi or Cellular Data.';

abstract class APIBasic {
  static const bool debug = bool.fromEnvironment("dart.vm.product") != true;
  final uuid = Uuid();
  String? locale, guid, appVersion, appBrand, apiCategory;

  Dio getDio({
    String? baseUrl,
  }) {
    final dio = Dio();
    this.apiCategory = apiCategory;
    dio.options.connectTimeout = timeout;
    dio.options.sendTimeout = timeout;
    dio.options.receiveTimeout = timeout;
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }
    _setupCommonHeaders(dio);
    return dio;
  }

  Future<CommonResponse<T>> requestCall<T>(ApiCall<T> apiCall) async {
    T? response;
    CommonError? error;
    DioError? dioError;
    final start = DateTime.now();
    DateTime end;
    try {
      response = await apiCall.call();
      end = DateTime.now();
    } on Exception catch (obj) {
      end = DateTime.now();
      if (obj is DioError) {
        dioError = obj;
        error = buildError(obj);
      }
      var duration = end.difference(start).inMicroseconds * 1000;
      Map<String, dynamic> details = buildLogDetails(
        duration,
        null, // take it from dioError response
        dioError,
        error,
      );
      await logApi(apiCategory, "requestCall", details: details, isError: true);
    }

    return CommonResponse(response: response, error: error);
  }

  Future<CommonResponse<T>> requestCallWithDetails<T>(
      ApiCallCorrelated<retrofit.HttpResponse<T>> apiCall,
      [String msg = 'api= (api msg not given)']) async {
    retrofit.HttpResponse<T>? response;
    CommonError? error;
    final start = DateTime.now();
    final requestId = uuid.v4();
    DateTime end;
    DioError? dioError;

    try {
      response = await apiCall.call(requestId);
      end = DateTime.now();
    } on Exception catch (obj) {
      end = DateTime.now();
      if (obj is DioError) {
        error = buildError(obj);
        dioError = obj;
      }
    }
    var duration = end.difference(start).inMicroseconds * 1000;
    Map<String, dynamic> details = buildLogDetails(
      duration,
      response?.response,
      dioError,
      error,
    );

    //todo: remove oneapp_common from local ev logger later
    //await logApi(apiCategory, msg, details: details, isError: error != null);
    try {
      debugPrint(details.toString());
    } catch (e) {
      debugPrint(e.toString());
    }

    return CommonResponse(response: response?.data, error: error);
  }

  Map<String, dynamic> buildLogDetails(
    int duration,
    Response<dynamic>? response,
    DioError? dioError,
    CommonError? error,
  ) {
    final Map<String, dynamic> details = {};
    details["duration"] = duration;
    final detailResponse = response ?? dioError?.response;
    // Response info, it may be `null` if the request can't reach to the http server,
    // for example, occurring a dns error, network is not available.
    final uri = detailResponse != null
        ? detailResponse.requestOptions.uri
        : dioError?.requestOptions.uri;
    if (uri != null) {
      details["http.url"] = uri.toString();
      details["http.url_details.host"] = uri.host;
      details["http.url_details.port"] = uri.port;
      details["http.url_details.path"] = uri.path;
      details["http.url_details.queryString"] = uri.queryParameters;
      details["http.url_details.scheme"] = uri.scheme;
    }
    if (detailResponse != null) {
      details["http.status_code"] = detailResponse.statusCode;
    }

    details["http.method"] = detailResponse != null
        ? detailResponse.requestOptions.method
        : dioError!.requestOptions.method;

    if (error != null) {
      details["error.kind"] = error.errorCodeString;
      details["error.message"] = error.errorMessage;
    }
    return details;
  }

  CommonError buildError(DioError obj) {
    CommonError? error;
    final res = obj.response;
    if (res?.data != null && res?.data is Map<String, dynamic>) {
      error = buildErrorFromData(res, obj);
    } else {
      error = buildErrorFromPlatformError(obj);
    }
    if (error == null) {
      error = buildErrorFromResponse(res);
    }
    return error;
  }

  CommonError buildErrorFromData(
    Response<dynamic>? res,
    DioError obj,
  ) {
    CommonError error;
    var errorEntity;
    try {
      errorEntity = ErrorResponse.fromJson(res?.data);
    } catch (e) {}
    if (errorEntity == null) {
      try {
        errorEntity = ErrorEntity.fromJson(res?.data);
      } catch (e) {}
    }
    if (errorEntity == null) {
      if (res?.data['error'] != null) {
        errorEntity = ErrorEntity(message: res?.data['error']);
      }
    }
    if (errorEntity is ErrorEntity && errorEntity.message?.isNotEmpty == true) {
      error = CommonError(
          errorCode: SERVER_ERROR, errorMessage: errorEntity.message);
    } else if (errorEntity is ErrorResponse &&
        errorEntity.status?.messages.isNotEmpty == true) {
      var msgItem = errorEntity.status?.messages.first.detailedDescription ??
          errorEntity.status?.messages.first.description;
      if (msgItem != null) {
        error = CommonError(errorCode: SERVER_ERROR, errorMessage: msgItem);
      } else {
        error = CommonError(errorCode: SERVER_ERROR, errorMessage: obj.message);
      }
    } else {
      error = CommonError(errorCode: SERVER_ERROR, errorMessage: obj.message);
    }
    return error;
  }

  CommonError buildErrorFromResponse(Response<dynamic>? res) {
    final result = CommonError(
        errorCode: res?.statusCode ?? SERVER_ERROR,
        errorMessage: res?.statusMessage ?? res?.toString());
    return result;
  }

  CommonError? buildErrorFromPlatformError(DioError obj) {
    int errorCode;
    String? errorMsg;
    CommonError? error;
    try {
      switch (obj.error) {
        case SocketException:
          errorCode = NETWORK_ERROR;
          break;
        case TimeoutException:
          errorCode = REQUEST_TIMEOUT_ERROR;
          break;
        default:
          errorCode = HTTP_SERVER_ERROR;
          break;
      }
      errorMsg = obj.error?.toString();
    } catch (e) {
      errorCode = HTTP_SERVER_ERROR;
      errorMsg = "error in api";
    }
    if (errorMsg != null) {
      error = CommonError(errorCode: errorCode, errorMessage: errorMsg);
    }
    return error;
  }

  Future<void> logApi(String? apiCategory, String msg,
      {Map<String, dynamic>? details, bool isError = true}) async {
    try {
      debugPrint(details.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _setupCommonHeaders(Dio dio) {
    dio.options
      // ..headers["X-OSVERSION"] = Platform.operatingSystemVersion
      // ..headers["X-APPVERSION"] = appVersion ?? "1.0"
      // ..headers["X-OSNAME"] = Platform.isIOS ? "iOS" : "Android";
      ..headers['X-Shopify-Access-Token'] = shopifyAccessToken
      ..headers["Access-Control-Allow-Origin"] =
          "*" // Required for CORS support to work
      ..headers["Access-Control-Allow-Credentials"] =
          true // Required for cookies, authorization headers with HTTPS
      ..headers["Access-Control-Allow-Headers"] =
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale"
      ..headers["Access-Control-Allow-Methods"] =
          "POST, GET, OPTIONS, PUT, DELETE, HEAD";
  }
}
