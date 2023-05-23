import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class ProcessingOverLay extends StatelessWidget {
  const ProcessingOverLay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.network(
            'https://assets7.lottiefiles.com/packages/lf20_d8bmxmlo.json',
            height: 35.h),
        Text(
          "Loading ..... ",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 16,
              height: 1.5,
              fontWeight: FontWeight.w700,
              color: Colors.black),
        )
      ],
    );
  }
}
