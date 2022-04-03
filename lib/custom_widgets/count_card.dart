import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunchtime_frontend/utils/strings.dart';

class CountCard extends StatelessWidget {
  const CountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 120,
            width: 160,
            child: Card(
              elevation: 10,
              shadowColor: Color.fromRGBO(
                0,
                0,
                0,
                0.3,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Text(
                      StringApp.available,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 18.0,
                    ),
                    child: Text(
                      "100",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 120,
            width: 160,
            child: Card(
              elevation: 10,
              shadowColor: Color.fromRGBO(0, 0, 0, 0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                child: Column(
                  children: [
                    Text(
                      StringApp.total,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 18.0,
                      ),
                      child: Text(
                        "78",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
