import 'package:flutter/material.dart';

class AfterScanResult extends StatelessWidget {
  const AfterScanResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('after QR scan!'),
      ),
      body: Center(
        child: Container(
          color: Colors.redAccent,
          child: const Text(
            'Now you Can have a lunch!',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
