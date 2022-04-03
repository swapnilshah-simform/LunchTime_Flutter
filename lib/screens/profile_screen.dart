import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/custom_widgets/profile_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          ProfileAppBar(),
        ],
      ),
    );
  }
}
