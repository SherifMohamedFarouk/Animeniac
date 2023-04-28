// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import '../../../shared/theme/color_palete.dart';

// class ClickableText extends StatelessWidget {
//   const ClickableText({
//     Key? key,
//     this.normalText,
//     required this.clickableText,
//     required this.clickAction,
//     required this.linkStyle,
//     this.defaultStyle,
//   }) : super(key: key);
//   final String? normalText;
//   final String clickableText;
//   final Function clickAction;
//   final TextStyle linkStyle;
//   final TextStyle? defaultStyle;

//   @override
//   Widget build(BuildContext context) {
//     //  TextStyle defaultStyle = TextStyle();
//     //  TextStyle linkStyle = TextStyle();
//     return RichText(
//       text: TextSpan(
//         style: defaultStyle,
//         children: <TextSpan>[
//           TextSpan(text: normalText),
//           TextSpan(
//               text: clickableText,
//               style: linkStyle,
//               recognizer: TapGestureRecognizer()..onTap = clickAction()),
//         ],
//       ),
//     );
//   }
// }
