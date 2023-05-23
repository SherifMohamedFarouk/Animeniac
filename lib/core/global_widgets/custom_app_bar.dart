// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// import 'custom_tab_bar.dart';

// class CustomAppBar extends StatelessWidget {
//   final List<IconData> icons;
//   final int selectedIndex;
//   final Function(int) onTap;

//   const CustomAppBar(
//       {Key? key,
//       required this.icons,
//       required this.selectedIndex,
//       required this.onTap})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height:
//           //  65,
//           2.h,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       decoration: const BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 2),
//             blurRadius: 4.0,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             height: double.infinity,
//             width:
//                 // 600,
//                 10.w,
//             child: CustomTabBar(
//                 icons: icons,
//                 selectedIndex: selectedIndex,
//                 action: onTap,
//                 isBottomIndicator: true),
//           ),
//         ],
//       ),
//     );
//   }
// }
