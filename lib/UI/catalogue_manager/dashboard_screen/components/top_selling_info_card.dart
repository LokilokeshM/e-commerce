import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopSellingInfo {
  final String? title, imageSrc;
  final int? orderCount;
  final String? price;
  TopSellingInfo({
    this.title = "",
    this.imageSrc = "",
    this.orderCount = 0,
    this.price = "",
  });
}

class TopSellingInfoCard extends StatelessWidget {
  const TopSellingInfoCard({Key? key, required this.info}) : super(key: key);
  final TopSellingInfo info;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.network(info.imageSrc ?? ""),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Rs.${info.price ?? ""}",
                    style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Text(info.orderCount.toString())
        ],
      ),
    );
  }
}
