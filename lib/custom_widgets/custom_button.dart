import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunchtime_frontend/utils/colors.dart';
import 'package:lunchtime_frontend/utils/strings.dart';

class ElevatedGradientButton extends StatelessWidget {
  final String? label;
  final Function? onPressed;

  const ElevatedGradientButton({Key? key, this.onPressed, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13),
      height: 50,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.red,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          label ?? StringApp.textFieldHintDisplay,
          style: GoogleFonts.lato(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          onPressed!();
        },
      ),
    );
  }
}
