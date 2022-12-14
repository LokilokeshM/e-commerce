// // Flutter imports:
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// // Package imports:
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// // Common search bar - preferred dealer
// class SearchBar extends StatefulWidget {
//   SearchBar(
//       {Key? key,
//       this.textColor = const Color(0xFF000000),
//       this.textEditingController,
//       this.cursorColor = const Color(0xFF000000),
//       this.validationText = "Field is empty",
//       this.borderColor = const Color(0xFFFFFFFF),
//       this.borderErrorColor = const Color(0xFFFFFFFF),
//       this.prefixIconColor = const Color(0xFFFFFFFF),
//       this.suffixIconColor = const Color(0xFFFFFFFF),
//       this.hintText = "Search",
//       this.suffixSvgPath,
//       this.prefixSvgPath,
//       this.textLimit = 50,
//       this.suffixVisibility = false,
//       this.allowSpecialCharacters = false,
//       this.suffixIconClickCallBack,
//       this.submitCallBackListener,
//       this.onChangeCallBackListener,
//       this.backGroundColor,
//       this.elevation,
//       this.hintStyle})
//       : super(key: key);

//   final Color textColor;
//   final TextEditingController? textEditingController;
//   final Color cursorColor;
//   final String validationText;
//   final String hintText;
//   final String? suffixSvgPath;
//   final String? prefixSvgPath;
//   final Color borderColor;
//   final Color borderErrorColor;
//   final Color prefixIconColor;
//   final Color suffixIconColor;
//   final int textLimit;
//   final bool allowSpecialCharacters;
//   final bool suffixVisibility;
//   final Function? suffixIconClickCallBack;
//   final Function? submitCallBackListener;
//   final Function? onChangeCallBackListener;
//   final double? elevation;
//   final Color? backGroundColor;
//   final TextStyle? hintStyle;

//   @override
//   _SearchBarState createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   Function? _suffixIconClickCallBack;
//   late Function _submitClickCallBack;
//   late Function _onChangeCallBack;
//   Color? backGroundColor;
//   double? elevationValue;
//   TextStyle? hintStyle;

//   @override
//   void initState() {
//     super.initState();
//     _suffixIconClickCallBack =
//         widget.suffixIconClickCallBack ?? clickCallBackListener;
//     _submitClickCallBack =
//         widget.submitCallBackListener ?? clickCallBackListener;
//     _onChangeCallBack =
//         widget.onChangeCallBackListener ?? clickCallBackListener;
//     backGroundColor = widget.backGroundColor == null
//         ? colorUtil.tertiary15
//         : widget.backGroundColor;
//     elevationValue = widget.elevation == null ? 20 : widget.elevation;
//     hintStyle = widget.hintStyle == null
//         ? TextStyleExtension()
//             .newStyleWithColor(textStyleUtil.body2, colorUtil.tertiary07)
//         : widget.hintStyle;
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 80.h,
//       child: Card(
//         shadowColor: colorUtil.tertiary10,
//         elevation: elevationValue,
//         color: backGroundColor,
//         margin: EdgeInsets.fromLTRB(16.w, 19.h, 16.w, 15.h),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.r),
//         ),
//         child: TextField(
//           controller: widget.textEditingController,
//           cursorColor: widget.cursorColor,
//           onSubmitted: (value) {
//             _submitClickCallBack(value);
//           },
//           onChanged: (value) {
//             _onChangeCallBack(value);
//           },
//           inputFormatters: [
//             LengthLimitingTextInputFormatter(widget.textLimit),
//             if (!widget.allowSpecialCharacters)
//               FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 ]")),
//           ],
//           style: TextStyleExtension()
//               .newStyleWithColor(textStyleUtil.body2, widget.textColor),
//           decoration: InputDecoration(
//             border: InputBorder.none,
//             prefixIcon: Container(
//               padding: EdgeInsets.all(14.w),
//               child: SvgPicture.asset(
//                 widget.prefixSvgPath!,
//                 height: 6.w,
//                 width: 6.w,
//                 color: widget.prefixIconColor,
//                 allowDrawingOutsideViewBox: false,
//               ),
//             ),
//             suffixIcon: Visibility(
//               visible: widget.suffixVisibility,
//               child: Container(
//                 padding: EdgeInsets.all(14.w),
//                 child: InkWell(
//                   onTap: _suffixIconClickCallBack as void Function()?,
//                   child: SvgPicture.asset(
//                     widget.suffixSvgPath!,
//                     height: 6.w,
//                     width: 6.w,
//                     color: widget.suffixIconColor,
//                     allowDrawingOutsideViewBox: false,
//                   ),
//                 ),
//               ),
//             ),
//             hintStyle: hintStyle,
//             hintText: widget.hintText,
//             errorStyle: TextStyleExtension().newStyleWithColor(
//                 textStyleUtil.caption2, widget.borderErrorColor),
//           ),
//         ),
//       ),
//     );
//   }

//   void clickCallBackListener(String data) {}
// }
