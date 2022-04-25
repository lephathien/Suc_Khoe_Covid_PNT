import 'package:flutter/material.dart';

class DauHieu extends StatefulWidget {
  const DauHieu({key}) : super(key: key);

  @override
  State<DauHieu> createState() => _DauHieuState();
}

class _DauHieuState extends State<DauHieu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Dấu hiệu nhiễm bệnh"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/dauhieu.jpeg"),
            Image.asset("assets/images/phanbiet.jpeg"),
          ],
        ),
      ),
    );
  }
}
