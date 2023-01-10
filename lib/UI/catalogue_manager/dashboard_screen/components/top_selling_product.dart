import 'package:ecommerce/UI/catalogue_manager/dashboard_screen/dashboard_bloc.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

import 'top_selling_info_card.dart';

class TopSellingCard extends StatelessWidget {
  const TopSellingCard({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  final DashboardBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Selling Products",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          StreamBuilder<List<TopSellingInfo>?>(
              stream: bloc.topSellingInfoCardInfo,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 2 + 30,
                        child: Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return TopSellingInfoCard(
                                  info: snapshot.data![index],
                                );
                              }),
                        ),
                      )
                    : Container();
              })
        ],
      ),
    );
  }
}
