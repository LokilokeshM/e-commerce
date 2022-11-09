import 'package:flutter/material.dart';
import 'package:ecommerce/constant/constant.dart';

class TitleWithBtn extends StatelessWidget {
  const TitleWithBtn({
    Key? key,
    required this.title,
    required this.buttonText,
    this.press,
  }) : super(key: key);
  final String title;
  final String buttonText;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Chip(
                shape: const StadiumBorder(
                    side: BorderSide(color: kHeadingTextColor)),
                backgroundColor: kPrimaryColor,
                label: Text(
                  buttonText,
                  style: const TextStyle(color: kHeadingTextColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
