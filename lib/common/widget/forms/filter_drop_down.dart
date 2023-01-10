import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

import 'custom_drop_down.dart';

class FilterDropDown extends StatelessWidget {
  const FilterDropDown({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(
              color: bgColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: bgColor,
                      ),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Text(title)),
            ),
            Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: bgColor,
                      ),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: const CustomDropdown(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                ))
          ],
        ));
  }
}
// 