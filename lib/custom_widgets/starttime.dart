import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lunchtime_frontend/utils/strings.dart';

class StartTimeWidget extends StatelessWidget {
  StartTimeWidget({Key? key}) : super(key: key);

  final String formattedDate = DateFormat('hh:mm').format(
    DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            StringApp.start_time,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            formattedDate,
            style: GoogleFonts.lato(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
