import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lunchtime_frontend/utils/strings.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class BuildQrView extends StatefulWidget {
  BuildQrView({
    Key? key,
    required this.result,
    required this.controller,
    required this.qrKey,
  }) : super(key: key);

  Barcode? result;
  QRViewController? controller;
  GlobalKey qrKey;

  @override
  State<BuildQrView> createState() => _BuildQrViewState();
}

class _BuildQrViewState extends State<BuildQrView> {
  @override
  Widget build(BuildContext context) {
    void _onQRViewCreated(QRViewController controller) {
      setState(() {
        widget.controller = controller;
      });
      controller.scannedDataStream.listen((scanData) {
        setState(() {
          widget.result = scanData;
          if (widget.result != null && widget.result?.code == 'SimformFood') {
            Navigator.popAndPushNamed(context, StringApp.afterScanResultRoute);
          }
        });
      });
    }

    void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
      log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
      if (!p) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('no Permission')),
        );
      }
    }

    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: widget.qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }
}
