import 'package:ecommerce/UI/catalogue_manager/order/order_bloc.dart';
import 'package:ecommerce/UI/catalogue_manager/order/widgets/toShip/to_pack_page.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

class ShipOrderPage extends StatelessWidget {
  const ShipOrderPage({super.key, required this.bloc});
  final OrderBloc bloc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              PreferredSize(
                preferredSize: Size.fromHeight(AppBar().preferredSize.height),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: secondaryColor,
                    ),
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: Colors.blue,
                      ),
                      tabs: const [
                        Tab(
                          text: 'ToPack',
                        ),
                        Tab(
                          text: 'To Arrange Shipment',
                        ),
                        Tab(
                          text: 'To Handover',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: TabBarView(
                  children: [
                    ToPackPage(
                      bloc: bloc,
                      onTap: (String lable) {},
                    ),
                    const Center(
                      child: Text(
                        'Basic Settings',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Advanced Settings',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
