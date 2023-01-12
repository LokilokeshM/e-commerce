import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

import 'buyers_address_card.dart';
import 'buyers_info_card.dart';
import 'buyers_payment_info_card.dart';
import 'shipped_details_card.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 200,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            BuyersInfoCard(),
            SizedBox(
              height: defaultPadding,
            ),
            BuyersAddressCard(),
            SizedBox(
              height: defaultPadding,
            ),
            ShippedDetailsCard(),
            SizedBox(
              height: defaultPadding,
            ),
            BuyersPaymentInfoCard()
          ],
        ),
      ),
    );
  }
}
