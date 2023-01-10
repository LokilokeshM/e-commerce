import 'package:ecommerce/Apis/entity/order_list_response.dart';
import 'package:ecommerce/UI/catalogue_manager/order/Components/filter_page.dart';
import 'package:ecommerce/UI/catalogue_manager/order/Components/order_table.dart';
import 'package:ecommerce/UI/catalogue_manager/order/order_bloc.dart';
import 'package:ecommerce/common/widget/forms/simple_input_form.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ToPackPage extends StatelessWidget {
  ToPackPage({super.key, required this.onTap, required this.bloc});
  final OrderBloc bloc;
  final Function(String lable) onTap;
  List<String> priorityOrderList = ["Priority Delivery"];
  List<String> printStatusList = [
    "AWB UnPrinted",
    "AWB Printed",
    "Invoice Printed",
    "PickList Unprinted",
    "PickList Printed"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 5,
            decoration: const BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              children: [
                FilterPage(
                    title: "Priority Order",
                    tabs: priorityOrderList,
                    onTap: onTap),
                FilterPage(
                    title: "Print Status", tabs: printStatusList, onTap: onTap),
                Row(
                  children: [
                    const Text("Search : "),
                    SizedBox(height: 40, child: SimpleInputForm()),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: StreamBuilder<List<Order>?>(
                      stream: bloc.orderList,
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? OrderDataTable(
                                myData: snapshot.data ?? [],
                              )
                            : Container();
                      })),
            ),
          )
        ],
      ),
    );
  }
}
