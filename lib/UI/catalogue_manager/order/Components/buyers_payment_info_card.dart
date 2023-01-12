import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

class BuyersPaymentInfoCard extends StatelessWidget {
  const BuyersPaymentInfoCard({super.key});

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
              "Buyer Payment Information",
            ),
            const Text("Tax included in the fees."),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 8, child: Container()),
                Expanded(
                  flex: 8,
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: helper.length,
                      separatorBuilder: (context, index) =>
                          index != helper.length
                              ? Column(
                                  children: const [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      height: 1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                )
                              : Container(),
                      itemBuilder: (context, index) {
                        return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(helper[index].title),
                              Text(helper[index].price),
                            ]);
                      }),
                ),
              ],
            )
          ],
        ));
  }
}

class PaymentCardHelper {
  String title;
  String price;
  PaymentCardHelper({required this.title, required this.price});
}

List<PaymentCardHelper> helper = [
  PaymentCardHelper(title: "Subtotal", price: "\$18.9"),
  PaymentCardHelper(title: "Shipping Fee", price: "\$1.5"),
  PaymentCardHelper(title: "Aardae Discount Total", price: "\$-0"),
  PaymentCardHelper(title: "Seller Discount Total", price: "\$-0"),
  PaymentCardHelper(title: "Adjust amount", price: "\$0"),
  PaymentCardHelper(title: "Grand Total", price: "\$20.4")
];
