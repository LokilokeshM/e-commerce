import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

class BuyersInfoCard extends StatelessWidget {
  const BuyersInfoCard({super.key});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Buyer Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: buyersDetailsColumn([
                  BuyersDetailsColumnHelper(
                      title: "Customer Name", subTitle: "Lokesh"),
                  BuyersDetailsColumnHelper(
                      title: "Payment Method", subTitle: "Mixed Card")
                ]),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: buyersDetailsColumn([
                  BuyersDetailsColumnHelper(
                      title: "Customer Name", subTitle: "Lokesh"),
                  BuyersDetailsColumnHelper(
                      title: "Payment Method", subTitle: "Mixed Card")
                ]),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: buyersDetailsColumn([
                  BuyersDetailsColumnHelper(
                      title: "Customer Name", subTitle: "Lokesh"),
                  BuyersDetailsColumnHelper(
                      title: "Payment Method", subTitle: "Mixed Card")
                ]),
              ),
              const SizedBox(
                width: 50,
              ),
              deliveryDetailsWidget("92", "Successful Delivery Rate"),
              const SizedBox(
                width: 50,
              ),
              deliveryDetailsWidget("92", "Successful Delivery Rate")
            ],
          ),
        ],
      ),
    );
  }

  Widget buyersDetailsColumn(List<BuyersDetailsColumnHelper> helper) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: helper.length,
        itemBuilder: (context, index) => buyersDetailsColumnCard(
            helper[index].title, helper[index].subTitle));
  }

  Column buyersDetailsColumnCard(String title, String subTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text(subTitle),
      ],
    );
  }

  Row deliveryDetailsWidget(String percentage, String title) {
    return Row(
      children: [
        CircleAvatar(
          child: Text("$percentage%"),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(title)
      ],
    );
  }
}

class BuyersDetailsColumnHelper {
  String title;
  String subTitle;
  BuyersDetailsColumnHelper({this.title = "", this.subTitle = ""});
}
