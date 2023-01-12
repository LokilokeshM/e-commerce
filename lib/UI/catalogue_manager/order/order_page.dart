import 'package:ecommerce/Apis/entity/order_list_response.dart';
import 'package:ecommerce/Providers/menu_controller.dart';
import 'package:ecommerce/UI/catalogue_manager/Product/components/filter_tabs.dart';
import 'package:ecommerce/UI/catalogue_manager/components/header.dart';
import 'package:ecommerce/UI/catalogue_manager/order/Components/order_details.dart';
import 'package:ecommerce/common/responsive.dart';
import 'package:ecommerce/UI/catalogue_manager/order/Components/order_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../constant/constant.dart';
import '../wrapper/order_wrapper.dart';
import 'Components/filter_page.dart';
import 'order_bloc.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final OrderBloc _bloc = OrderBloc();
  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Header(
              buildContext: context,
            ),
            Row(
              children: [
                if (!Responsive.isDesktop(context))
                  IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: context.read<MenuController>().controlMenu,
                  ),
                Expanded(
                    flex: 2,
                    child: Text("Order Managenment",
                        style: Theme.of(context).textTheme.headline6)),
                if (!Responsive.isMobile(context))
                  Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                // const Expanded(flex: 3, child: PercentageCard())
              ],
            ),
            const SizedBox(height: defaultPadding),
            const OrderDetails()
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       flex: 5,
            //       child: Column(
            //         children: [
            //           // MyFiles(
            //           //   bloc: widget.bloc,
            //           // ),
            //           const SizedBox(height: defaultPadding),
            //           // _bottomNavBar(),
            //           SizedBox(
            //               height: 100,
            //               child: MyTabbedPage(
            //                 tabs: OrderWrapper.orderTabs,
            //                 onTap: () {},
            //               )),
            //           const SizedBox(height: defaultPadding),
            //           FilterPage(
            //             title: "Order Status",
            //             tabs: const ["All", "Transaction Unavailable"],
            //             onTap: (lable) => {},
            //           ),
            //           const SizedBox(height: defaultPadding),
            //           StreamBuilder<List<Order>?>(
            //               stream: _bloc.orderList,
            //               builder: (context, snapshot) {
            //                 return snapshot.hasData
            //                     ? OrderDataTable(
            //                         myData: snapshot.data ?? [],
            //                       )
            //                     : Container();
            //               }),
            //           // ShipOrderPage(bloc: _bloc),
            //           // RecentFiles(bloc: widget.bloc, context: context),
            //           if (Responsive.isMobile(context))
            //             const SizedBox(height: defaultPadding),
            //           // if (Responsive.isMobile(context)) const StorageDetails(),
            //         ],
            //       ),
            //     ),
            //     // if (!Responsive.isMobile(context))
            //     //   SizedBox(width: defaultPadding),
            //     // On Mobile means if the screen is less than 850 we dont want to show it
            //     // if (!Responsive.isMobile(context))
            //     //   Expanded(
            //     //     flex: 2,
            //     //     child: StarageDetails(),
            //     //   ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
