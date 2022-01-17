import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QRScanner extends StatefulWidget {
  @override
  _QRScanner createState() => _QRScanner();
}

class _QRScanner extends State<QRScanner> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QR Code Scanner'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigoAccent,
                        textStyle: TextStyle(color: Colors.white)),
                    onPressed: scan,
                    child: const Text('SCAN')),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Expiry Date:"+ barcode,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.barcode = '');
    } catch (e) {
      setState(() => this.barcode = 'Unknown error: $e');
    }
    if (barcode != "") {
      if (DateTime.parse(barcode).compareTo(DateTime.now()) > 0) {
        setState(() {
         // barcode = "It is good to use";
          _showMaterialDialog("It is good to use",barcode,'assets/right.png');
        });
      } else {
        setState(() {
         // barcode = "It is expired";
          _showMaterialDialog("It is expired",barcode,'assets/wrong.jpg');
        });
      }
    }
  }

  _dismissDialog() {
    Navigator.pop(context);
  }
    void _showMaterialDialog(String data,String date,String image) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Xpire Alert'),
            content: Container(
              height: 100,
              child: Column(
                children: [
                  Image(image: AssetImage(image),height:50,width:80),
                  Text(data),
                  Text("Expiry Date: "+date)
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Close')),
            ],
          );
        });
  }
}
