import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationInfoCard extends StatelessWidget {
  const NotificationInfoCard({
    Key? key,
    required this.title,
    required this.svgSrc,
    required this.orderCount,
    required this.subTitle,
  }) : super(key: key);

  final String title, subTitle, svgSrc;
  final int orderCount;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: defaultPadding),
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
          borderRadius: const BorderRadius.all(
            Radius.circular(defaultPadding),
          ),
        ),
        child: ListTile(
          leading: SizedBox(
            height: 20,
            width: 20,
            child: SvgPicture.asset(svgSrc),
          ),
          title: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            subTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: Text(orderCount.toString()),
        ));
  }
}
