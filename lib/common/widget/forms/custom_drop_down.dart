import 'package:ecommerce/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key, this.borderRadius}) : super(key: key);
  final BorderRadius? borderRadius;
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonHideUnderline(
        child: GFDropdown(
          hint: const Text(
            "--- Select ---",
            textAlign: TextAlign.center,
          ),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
          border: const BorderSide(color: Colors.black12, width: 1),
          dropdownButtonColor: bgColor,
          value: dropdownValue,
          onChanged: (newValue) {
            setState(() {
              dropdownValue = newValue.toString();
            });
          },
          items: ['FC Barcelona', 'Real Madrid', 'Villareal', 'Manchester City']
              .map((value) => DropdownMenuItem(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
