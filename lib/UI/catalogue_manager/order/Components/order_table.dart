import 'package:ecommerce/Apis/entity/order_list_response.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDataTable extends StatefulWidget {
  OrderDataTable({
    Key? key,
    required this.myData,
  }) : super(key: key);
  List<Order>? myData;
  @override
  State<OrderDataTable> createState() => _OrderDataTableState();
}

class _OrderDataTableState extends State<OrderDataTable> {
  bool sort = true;
  List<Order>? filterData;

  void onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        filterData!.sort((a, b) => a.orderNumber!.compareTo(b.orderNumber!));
      } else {
        filterData!.sort((a, b) => b.orderNumber!.compareTo(a.orderNumber!));
      }
    }
  }

  @override
  void initState() {
    filterData = widget.myData;
    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100.h,
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: PaginatedDataTable(
          sortColumnIndex: 0,
          showCheckboxColumn: true,
          sortAscending: sort,
          header: Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                const Expanded(child: Text("Search:")),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Enter something to filter"),
                      onChanged: (value) {
                        setState(() {
                          widget.myData = filterData!
                              .where((element) => element.orderNumber
                                  .toString()
                                  .contains(value))
                              .toList();
                        });
                      },
                    ),
                  ),
                ),
                Expanded(flex: 10, child: Container())
              ],
            ),
          ),
          source: RowSource(
            myData: widget.myData!,
            count: widget.myData!.length,
          ),
          columns: dataColumn()),
    );
  }

  List<DataColumn> dataColumn() {
    return orderHeading
        .map((e) => DataColumn(
            label: Text(
              e.toString(),
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSortColum(columnIndex, ascending);
            }))
        .toList();
  }
}

class RowSource extends DataTableSource {
  List<Order> myData;
  final count;
  RowSource({
    required this.myData,
    required this.count,
  });

  @override
  DataRow? getRow(int index) {
    if (index < rowCount) {
      return recentFileDataRow(myData[index]);
    } else {
      return null;
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => count;

  @override
  int get selectedRowCount => 0;
}

DataRow recentFileDataRow(Order data) {
  return DataRow(
    cells: [
      DataCell(
          Text(
              "#${data.orderNumber != null ? data.orderNumber.toString() : ""}"),
          onTap: () {}),
      DataCell(
          Text(data.createdAt != null
              ? data.createdAt!.toLocal().toString()
              : ""),
          onTap: () {}),
      DataCell(Text(data.customer!.firstName ?? ""), onTap: () {}),
      DataCell(Text("Rs:${data.totalPrice}"), onTap: () {}),
      DataCell(Chip(label: Text(data.financialStatus ?? "")), onTap: () {}),
      DataCell(Chip(label: Text(data.fulfillmentStatus ?? "")), onTap: () {}),
      DataCell(
          Text(data.lineItems != null ? data.lineItems!.length.toString() : ""),
          onTap: () {}),
      DataCell(
          Text(data.shippingLines!.isNotEmpty
              ? data.shippingLines!.first.code.toString()
              : ""),
          onTap: () {}),
      DataCell(Text(data.tags ?? ""), onTap: () {}),
    ],
  );
}

// List<DataContent> myData = [
//   DataContent(
//       orderId: "11", customer: "Khaliq", date: "09876543", itemCount: 28),
//   DataContent(orderId: "23", customer: "David", date: "6464646", itemCount: 30),
//   DataContent(orderId: "44", customer: "Kamal", date: "8888", itemCount: 32),
//   DataContent(orderId: "44", customer: "Ali", date: "3333333", itemCount: 33),
//   DataContent(
//       orderId: "111121", customer: "Muzal", date: "987654556", itemCount: 23),
//   DataContent(
//       orderId: "234234", customer: "Taimu", date: "46464664", itemCount: 24),
//   DataContent(
//       orderId: "1134111", customer: "Mehdi", date: "5353535", itemCount: 36),
//   DataContent(orderId: "11111", customer: "Rex", date: "244242", itemCount: 38),
//   DataContent(
//       orderId: "111234211", customer: "Alex", date: "323232323", itemCount: 29),
// ];

// class DataContent {
//   final String? orderId;
//   final String? date;
//   final String? customer;
//   final double? total;
//   final String? payment_status;
//   final String? fulfilment_status;
//   final int? itemCount;
//   final String? deliveryMethod;
//   final String? tags;
//   DataContent(
//       {this.orderId,
//       this.date,
//       this.customer,
//       this.total,
//       this.payment_status,
//       this.fulfilment_status,
//       this.itemCount,
//       this.deliveryMethod,
//       this.tags});
// }

List<String> orderHeading = [
  "Order",
  "Date",
  "Customer",
  "Total",
  "Payment Status",
  "Fulfilment",
  "Item",
  "Delivery method",
  "Tags"
];
