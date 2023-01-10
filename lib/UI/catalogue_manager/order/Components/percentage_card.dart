import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

class PercentageCard extends StatelessWidget {
  const PercentageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 10,
        color: secondaryColor,
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return cardDetails();
            },
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.white,
                  thickness: 3,
                ),
            itemCount: 5));
  }

  Widget cardDetails() {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Text("Cancellation Rate"),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.warning_rounded)),
          ]),
          Row(children: [
            Text("Cancellation Rate"),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.warning_rounded)),
          ]),
        ],
      ),
    );
  }
}
