import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

import 'seller_info_card.dart';

class SellerScoreCard extends StatelessWidget {
  const SellerScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Seller Score",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: defaultPadding),
          TopCard(),
          SizedBox(height: defaultPadding),
          BottomCard(),
          SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}

class BottomCard extends StatelessWidget {
  const BottomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        SellerInfoCard(
          title: 'Non-Complance Point',
          status: 'Status',
        ),
        SellerInfoCard(
          title: '0',
          status: 'Healthy',
        ),
        SizedBox(
          height: 10,
        ),
        SellerInfoCard(
          title: 'Metrics',
          status: 'Status',
        ),
        SellerInfoCard(
          title: 'Product Quality Rating',
          status: 'Healthy',
        ),
        SellerInfoCard(
          title: 'Cancellation Rate',
          status: 'Healthy',
        ),
        SellerInfoCard(
          title: 'Package NOt Ready',
          status: 'Healthy',
        ),
        SellerInfoCard(
          title: 'Ship On Time',
          status: 'Healthy',
        ),
        SizedBox(height: defaultPadding),
        Text(
          "View More >",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}

class TopCard extends StatelessWidget {
  const TopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Excellent",
          style: TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Text(
          "Your Store is doing well. Review Violations (if Any) and continue to keep up with the good work ! ",
          maxLines: 2,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.w400),
        ),
        Text(
          "View Seller Polices >",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
