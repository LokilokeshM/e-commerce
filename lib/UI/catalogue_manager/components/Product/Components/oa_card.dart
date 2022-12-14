// Flutter imports:
import 'package:ecommerce/common/color_config.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardStyle {
  final Color? shadowColor;
  final Color? backgroundColor;
  late double borderRadius;
  late double elevation;
  CardStyle({
    this.shadowColor,
    this.backgroundColor,
    double? borderRadius,
    double? elevation,
  }) {
    this.borderRadius = borderRadius ?? 8.r;
    this.elevation = elevation ?? 30.h;
  }
}

class OACard extends StatelessWidget {
  final Widget? cardChild;
  final Function? onPress;
  final CardStyle? cardStyle;
  OACard({
    Key? key,
    required this.cardChild,
    this.cardStyle,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _style = cardStyle;
    _style ??= CardStyle(
      backgroundColor: HexColor("#FAFAFA"),
      shadowColor: Color.fromRGBO(0, 0, 0, 0.7),
      borderRadius: 8.r,
      elevation: 5.h,
    );
    return GestureDetector(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_style.borderRadius),
          ),
          elevation: _style.elevation,
          shadowColor: _style.shadowColor,
          color: _style.backgroundColor,
          child: cardChild),
    );
  }
}
