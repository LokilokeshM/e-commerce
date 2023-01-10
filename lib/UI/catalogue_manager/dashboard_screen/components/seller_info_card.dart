import 'package:flutter/material.dart';

class SellerInfoCard extends StatelessWidget {
  const SellerInfoCard({
    super.key,
    required this.title,
    required this.status,
    this.statusColor = Colors.grey,
  });
  final String title;
  final String status;
  final Color? statusColor;
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(color: statusColor),
            ),
          )
        ]);
  }
}
