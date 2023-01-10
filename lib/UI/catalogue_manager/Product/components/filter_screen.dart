import 'package:ecommerce/common/widget/forms/custom_drop_down.dart';
import 'package:ecommerce/common/widget/forms/filter_drop_down.dart';
import 'package:ecommerce/common/widget/forms/simple_input_form.dart';
import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedValue = "USA";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: const [
            Expanded(
                child: FilterDropDown(
              title: "Product Name",
            )),
            Expanded(
                child: FilterDropDown(
              title: "Brand Category",
            )),
            Expanded(
                child: FilterDropDown(
              title: "Types",
            )),
          ],
        )
        // Column(
        //   children: [
        // Row(
        //   children: const [
        //     Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Text(
        //         "Filter Product:",
        //       ),
        //     ),
        //     Padding(
        //       padding: EdgeInsets.all(8.0),
        //       child: Chip(
        //           label: Text(
        //         "Out of Stock",
        //       )),
        //     ),
        //     Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Chip(
        //             label: Text(
        //           "Pickup in Store",
        //         )))
        //   ],
        // ),
        // Row(children: [
        //   Expanded(
        //     child: Container(
        //       decoration: BoxDecoration(
        //           borderRadius: const BorderRadius.all(Radius.circular(10)),
        //           border: Border.all(
        //             color: Colors.black,
        //             width: 0.1,
        //           )),
        //       child: Row(
        //         children: [
        //           Expanded(
        //             flex: 3,
        //             child: Container(
        //               width: 20,
        //               child: DropdownButton(
        //                   value: selectedValue,
        //                   style: TextStyle(color: Colors.red, fontSize: 30),
        //                   onChanged: (String? newValue) {
        //                     setState(() {
        //                       selectedValue = newValue!;
        //                     });
        //                   },
        //                   items: dropdownItems),
        //             ),
        //           ),
        //           Expanded(
        //             flex: 5,
        //             child: SimpleInputForm(),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        //   SizedBox(
        //     width: 50,
        //   ),
        //   Expanded(
        //     child: SimpleInputForm(),
        //   ),
        //   Expanded(
        //     child: SimpleInputForm(),
        //   ),
        // ]),
        // ],

        );
  }
}
