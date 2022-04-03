import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lunchtime_frontend/utils/strings.dart';

import '../data/feedback_model.dart';
import '../retrofit/api_service.dart';

class FeedbackScreenWidget extends StatelessWidget {
  FeedbackScreenWidget({Key? key}) : super(key: key);

  double star = 0;
  String comment = "";
  TextEditingController feedback = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 8,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringApp.feedback,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringApp.how,
              textAlign: TextAlign.left,
              style: (TextStyle(
                fontSize: 20,
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: RatingBar.builder(
              initialRating: 3,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                  default:
                    return Container();
                }
              },
              onRatingUpdate: (rating) {
                star = rating;
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Divider(
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 8),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringApp.care,
              style: GoogleFonts.lato(fontSize: 16),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              border: Border.all(
                width: 1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.zero,
              child: TextFormField(
                controller: feedback,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                ),
                style: GoogleFonts.lato(
                  fontSize: 22,
                ),
                maxLines: 3,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Divider(
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ElevatedButton(
            onPressed: () async {
              var res = await client.feedback(
                FeedbackReview(
                  menu_rev_star: star,
                  menu_rev_comment: feedback.text,
                ),
              );
              if (res.response.statusCode == 201) {
                print("Sucess");
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                StringApp.publsih,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
          ),
          child: Text(
            "Your review will be taken care by us",
          ),
        ),
      ],
    );
  }
}
