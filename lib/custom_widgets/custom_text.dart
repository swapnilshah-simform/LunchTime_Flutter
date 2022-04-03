import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/utils/colors.dart';
class CustomText extends StatelessWidget {
  final String? child;
  final Function? onTap;
  final String? firstText;
  final String? secondText;
  const CustomText(
      {Key? key, this.child, this.onTap, this.firstText, this.secondText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: firstText,
              style: const TextStyle(
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: secondText,
              style: const TextStyle(
                  color: AppColors.red, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = onTap! as GestureTapCallback?,
            ),
          ],
        ),
      ),
    );
  }
}