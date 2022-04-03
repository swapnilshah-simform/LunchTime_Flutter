import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/utils/colors.dart';
import 'package:lunchtime_frontend/utils/strings.dart';

class HomeScreenButton extends StatelessWidget {
  const HomeScreenButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 50,
          width: 160,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, StringApp.feedbackRoute);
            },
            icon: const Icon(
              Icons.feedback,
            ),
            label: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Feedback",
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(
                AppColors.red,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: 160,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, StringApp.qrScannerRoute);
            },
            icon: const Icon(
              Icons.qr_code,
            ),
            label: const Text(
              "Scan QR",
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                    color: AppColors.red,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
