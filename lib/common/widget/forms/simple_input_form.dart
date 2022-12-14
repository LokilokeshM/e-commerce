// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SimpleInputForm extends StatefulWidget {
  SimpleInputForm(
      {Key? key,
      this.textColor = const Color(0xFFFFFFFF),
      this.textEditingController,
      this.cursorColor = const Color(0xFFFFFFFF),
      this.validationText = "Field is empty",
      this.borderColor = const Color(0xFFFFFFFF),
      this.borderErrorColor = const Color(0xFFFFFFFF),
      this.prefixIconColor = const Color(0xFFFFFFFF),
      this.suffixIconColor = const Color(0xFFFFFFFF),
      this.prefixIconErrorColor = const Color(0xFFFFFFFF),
      this.suffixIconErrorColor = const Color(0xFFFFFFFF),
      this.hintText = "Enter the value",
      this.suffixSvgPath,
      this.suffixIconHeight,
      this.suffixIconWidth,
      this.prefixSvgPath,
      this.explanationText,
      this.textLimit = 50,
      this.maxNumberOfLines = 1,
      this.minNumberOfLines = 1,
      this.isExtraValidationAvailable = false,
      this.allowSpecialCharacters = false,
      this.keyboardType = TextInputType.emailAddress,
      this.isEnabled = true,
      this.focusNode,
      this.creditCardFormatter = false})
      : super(key: key);

  final Color textColor;
  final TextEditingController? textEditingController;
  final Color cursorColor;
  final String validationText;
  final String hintText;
  final String? suffixSvgPath;
  final double? suffixIconWidth;
  final double? suffixIconHeight;
  final String? prefixSvgPath;
  final Color borderColor;
  final Color borderErrorColor;
  final Color prefixIconColor;
  final Color suffixIconColor;
  final Color prefixIconErrorColor;
  final Color suffixIconErrorColor;
  final String? explanationText;
  final int textLimit;
  final bool allowSpecialCharacters;
  final int maxNumberOfLines;
  final int minNumberOfLines;
  final bool isExtraValidationAvailable;
  final TextInputType keyboardType;
  final bool isEnabled;
  final FocusNode? focusNode;
  final bool creditCardFormatter;

  @override
  _SimpleInputFormState createState() => _SimpleInputFormState();
}

class _SimpleInputFormState extends State<SimpleInputForm> {
  //bool _isError = false;
  TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.textEditingController;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          width: 300,
          child: TextFormField(
            controller: _textEditingController,
            cursorColor: widget.cursorColor,
            enabled: widget.isEnabled,
            /*   autovalidateMode: AutovalidateMode.onUserInteraction,*/
            maxLines: widget.maxNumberOfLines,
            minLines: widget.minNumberOfLines,
            keyboardType: widget.keyboardType,
            focusNode: widget.focusNode,
            textCapitalization: TextCapitalization.sentences,
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.textLimit),
              if (widget.keyboardType == TextInputType.number &&
                  widget.creditCardFormatter == true)
                MaskedTextInputFormatter(
                  mask: 'xx/xxxx',
                  separator: '/',
                )
              else if (widget.keyboardType == TextInputType.number)
                FilteringTextInputFormatter.allow(RegExp("[0-9 ]"))
              else if (!widget.allowSpecialCharacters)
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]")),
            ],
            style: TextStyle(color: widget.textColor),
            // style: TextStyleExtension()
            //     .newStyleWithColor(textStyleUtil.body3, widget.textColor),
            /*    validator: (text) {
              if (text == null || text.isEmpty) {
                return widget.validationText;
              } else if (widget.isExtraValidationAvailable != null &&
                  widget.isExtraValidationAvailable &&
                  text.length < 5) {
                return widget.validationText;
              }
        
              return null;
            },*/
            decoration: InputDecoration(
              hintText: widget.hintText,
              errorStyle: TextStyle(color: widget.borderErrorColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: widget.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: widget.borderColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: widget.borderColor,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color: widget.borderErrorColor),
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: widget.borderErrorColor)),
              suffixIcon: widget.suffixSvgPath != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: UnconstrainedBox(
                        child: SvgPicture.asset(
                          widget.suffixSvgPath!,
                          width:
                              widget.suffixIconWidth ?? widget.suffixIconWidth,
                          height: widget.suffixIconHeight ??
                              widget.suffixIconHeight,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
        (widget.explanationText == null)
            ? Container()
            : Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Text(
                  widget.explanationText!,
                ),
              ),
      ],
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  }) {}

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
