import 'package:flutter/material.dart';

class OrderWrapper {
  static const List<String> orderTabsList = [
    "All",
    "Unpaid",
    "To Ship",
    "Shipping",
    "Delivered",
    "Return or Refund",
    "Cancellation"
  ];
  static List<Tab> orderTabs = orderTabsList
      .map(
        (e) => Tab(
          text: e,
        ),
      )
      .toList();
  //   Tab(
  //     text: "All",
  //   ),
  //   Tab(
  //     text: "Unpaid",
  //   ),
  //   Tab(
  //     text: "To Ship",
  //   ),
  //   Tab(
  //     text: "Shipping",
  //   ),
  //   Tab(
  //     text: "Delivered",
  //   ),
  //   Tab(
  //     text: "Return or Refund",
  //   ),
  //   Tab(
  //     text: "Cancellation",
  //   ),
  // ];

  static String getOrderPath() {
    return "";
  }
}
