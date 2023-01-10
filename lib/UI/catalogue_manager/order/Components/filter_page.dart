import 'package:ecommerce/common/widget/lable/custom_list_lable.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterPage extends StatelessWidget {
  const FilterPage(
      {Key? key, required this.title, required this.tabs, required this.onTap})
      : super(key: key);
  final String title;
  final List<String> tabs;
  final Function(String lable) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width - 200.h,
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(children: [
        Expanded(flex: 1, child: Text("${title}:")),
        Expanded(
          flex: 10,
          child: CustomLableList(
            label: tabs,
            onTap: (String label) {},
          ),
        ),
      ]),
    );
  }
}
// const ["All", "Transaction Unavailable"]
