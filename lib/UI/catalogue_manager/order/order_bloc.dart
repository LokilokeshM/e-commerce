import 'package:ecommerce/Apis/entity/order_list_response.dart';
import 'package:ecommerce/Apis/network_implementation/app/api_client/app_client.dart';
import 'package:ecommerce/Bloc/bloc_provider.dart';
import 'package:ecommerce/app_provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class OrderBloc extends BlocBase {
  AppClient get api => AppProvider.getAppAPI();

  Stream<List<Order>?> get orderList => _orderList.stream;
  final _orderList = BehaviorSubject<List<Order>?>();

  void init() {
    getOrderList();
  }

  @override
  void dispose() {}

  Future<void> getOrderList() async {
    try {
      final commonResponse = await api.getOrderListStatus();
      if (commonResponse.error != null) {
        debugPrint(commonResponse.error!.errorMessage.toString());
      }

      if (commonResponse.response != null) {
        if (commonResponse.response!.orders!.isNotEmpty) {
          _orderList.sink.add(commonResponse.response!.orders);
          debugPrint(commonResponse.response!.orders.toString());
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
