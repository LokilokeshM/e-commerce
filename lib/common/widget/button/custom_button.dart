// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Package imports:
enum PrimaryButtonState { ACTIVE, INACTIVE }

class CustomDefaultButton extends StatefulWidget {
  CustomDefaultButton(
      {Key? key,
      this.backgroundColor = Colors.black,
      this.buttonTextColor = Colors.white,
      this.text = "Button Text",
      this.textStyle,
      this.press,
      this.primaryButtonState = PrimaryButtonState.ACTIVE,
      this.disabledBackgroundColor = Colors.grey,
      this.disabledButtonTextColor = Colors.white,
      this.borderColor = Colors.grey,
      this.horizontalPadding = 16,
      this.verticalPadding = 16,
      this.textAlign = null})
      : super(key: key);
  final String? text;
  final TextStyle? textStyle;
  final Function? press;
  final Color backgroundColor;
  final Color buttonTextColor;
  final Color disabledBackgroundColor;
  final Color disabledButtonTextColor;
  final Color borderColor;
  final double horizontalPadding;
  final double verticalPadding;
  final PrimaryButtonState primaryButtonState;
  final TextAlign? textAlign;

  @override
  _CustomDefaultButtonState createState() => _CustomDefaultButtonState();
}

class _CustomDefaultButtonState extends State<CustomDefaultButton> {
  PrimaryButtonState _primaryButtonState = PrimaryButtonState.ACTIVE;
  Color _newBackgroundColor = Color.fromRGBO(40, 40, 48, 1);
  late Color _newButtonTextColor;

  @override
  void initState() {
    super.initState();
    _primaryButtonState = widget.primaryButtonState;
  }

  @override
  void didUpdateWidget(CustomDefaultButton oldWidget) {
    if (_primaryButtonState != widget.primaryButtonState) {
      setState(() {
        _primaryButtonState = widget.primaryButtonState;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (_primaryButtonState == PrimaryButtonState.ACTIVE) {
      _newBackgroundColor = widget.backgroundColor;
      _newButtonTextColor = widget.buttonTextColor;
    } else {
      _newBackgroundColor = widget.disabledBackgroundColor;
      _newButtonTextColor = widget.disabledButtonTextColor;
    }

    return SizedBox(
      height: 30.h,
      width: 192.w,
      child: TextButton(
        onPressed: () {
          widget.press?.call();
        },
        style: TextButton.styleFrom(
          backgroundColor: _newBackgroundColor,
          shape: StadiumBorder(),
        ),
        child: Container(
          height: 20.h,
          width: 192.w,
          child: Text(
            widget.text!,
            style: widget.textStyle ??
                const TextStyle(
                  color: Colors.black,
                ),
            textAlign: widget.textAlign ?? TextAlign.center,
          ),
        ),
      ),
    );
  }
}
