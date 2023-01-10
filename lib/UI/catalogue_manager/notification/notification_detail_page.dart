import 'package:ecommerce/UI/catalogue_manager/notification/notification_info_card.dart';
import 'package:flutter/material.dart';

class NotificationDetailPage extends StatelessWidget {
  const NotificationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const NotificationInfoCard(
            title: "Oder",
            subTitle: "Skin Care",
            svgSrc: "",
            orderCount: 10,
          );
        });
  }
}
