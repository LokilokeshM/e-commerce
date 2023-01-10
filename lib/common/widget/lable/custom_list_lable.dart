import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLableList extends StatelessWidget {
  const CustomLableList({
    super.key,
    required this.label,
    this.labelColor,
    required this.onTap,
  });
  final List<String>? label;
  final Color? labelColor;
  final Function(String label) onTap;
  @override
  Widget build(BuildContext context) {
    return label != null
        ? ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: label!.length,
            separatorBuilder: (context, index) => const SizedBox(
              width: 5,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    onTap(label![index]);
                  },
                  child: Chip(
                    backgroundColor: labelColor ?? Colors.grey,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    label: Text(
                      label![index],
                      textAlign: TextAlign.center,
                    ),
                  ));
            },
          )
        : Container();
  }
}
