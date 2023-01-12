import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

class ShippedDetailsCard extends StatelessWidget {
  const ShippedDetailsCard({super.key});

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
              "OrderNumber:  91244211421026",
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: const [
                Text(
                  "Shipped Package",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Text(
                  " packageCount",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  width: defaultPadding,
                ),
                Text(
                  "(1 Item)",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            "https://cdn.shopify.com/s/files/1/0565/1903/2987/products/9.webp?v=1672725894",
                            height: 50,
                            width: 50,
                          ),
                          Column(
                            children: const [
                              Text(
                                "Everyday Moisturising Shampoo",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "Everyday Moisturising Shampoo",
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "₹8.00 × 1",
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                "₹${8.00 * 1}",
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ]),
                    const SizedBox(
                      height: defaultPadding,
                    )
                  ]);
                }),
          ],
        ));
  }
}
