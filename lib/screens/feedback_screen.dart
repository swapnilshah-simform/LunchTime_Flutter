import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/custom_widgets/feedback_widget.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          FeedbackScreenWidget(),
        ],
      ),
    );
  }
}
