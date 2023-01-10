import 'package:ecommerce/UI/catalogue_manager/components/header.dart';
import 'package:ecommerce/UI/catalogue_manager/dashboard_screen/components/order_details_card.dart';
import 'package:ecommerce/UI/catalogue_manager/dashboard_screen/dashboard_bloc.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/main_content.dart';
import 'components/my_files.dart';
import 'components/seller_score_card.dart';
import 'components/top_selling_product.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardBloc _bloc = DashboardBloc();
  @override
  void initState() {
    _bloc.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                buildContext: context,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              MyFiles(bloc: _bloc),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 4, child: SellerScoreCard()),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(flex: 4, child: TopSellingCard(bloc: _bloc)),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 4, child: OrderDetailsCard()),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(flex: 4, child: Container()),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
