import 'package:flutter/material.dart';

import '../utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.result,
  }) : super(key: key);

  final String result;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //client.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(
                  context,
                  StringApp.loginRoute,
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              widget.result.substring(15, 56),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            Text(
              widget.result.substring(57, 79),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
