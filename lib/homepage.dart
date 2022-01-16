
import 'package:barcode_scanner/barcode_generator.dart';
import 'package:barcode_scanner/qr_generator.dart';
import 'package:barcode_scanner/qr_scanner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: TextButton(
              child: Text("Scan QR/Bar code"),
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QRScanner()));
              },
            ),
          ),
          Center(
            child: TextButton(
              child: Text("Generate QR code"),
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QRGenerator()));
              },
            ),
          ),
          Center(
            child: TextButton(
              child: Text("Generate Barcode code"),
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BarcodeGenerator()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
