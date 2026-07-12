import 'package:flutter/material.dart';

class GifPage extends StatelessWidget {
  const GifPage(this._gifData, {super.key});

  final Map _gifData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_gifData["title"], style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white, // Altere para a cor desejada
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Image.network(_gifData["images"]["fixed_height"]["url"]),
      ),
    );
  }
}
