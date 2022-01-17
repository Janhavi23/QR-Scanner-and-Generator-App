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
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Xpire Alert'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 110.0,
                width: 150.0,
                child: Card(
                  color:Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                      side: new BorderSide(
                          color: Colors.indigoAccent, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.phone_android,color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QRScanner()));
                          }),
                      Text("Scan QR Code",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight:FontWeight.bold))
                    ],
                  ),
                ),
              ),
              Container(
                height: 110.0,
                width: 150.0,
                child: Card(
                  color:Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                      side: new BorderSide(
                          color: Colors.indigoAccent, width: 2.0),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Column(
                    children: [
                      IconButton(
                          icon: Icon(Icons.qr_code,color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QRGenerator()));
                          }),
                      Text("Generate QR code",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight:FontWeight.bold))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
