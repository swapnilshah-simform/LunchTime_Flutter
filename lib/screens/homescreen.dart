import 'package:flutter/material.dart';

import '../custom_widgets/count_card.dart';
import '../custom_widgets/food_card.dart';
import '../custom_widgets/homescreen_button.dart';
import '../custom_widgets/starttime.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                StartTimeWidget(),
                const CountCard(),
                const FoodCardWidget(),
                HomeScreenButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
