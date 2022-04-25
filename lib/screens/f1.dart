import 'package:flutter/material.dart';

class f1quydinh extends StatefulWidget {
  const f1quydinh({key}) : super(key: key);

  @override
  State<f1quydinh> createState() => _f1quydinhState();
}

class _f1quydinhState extends State<f1quydinh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("F1 thực hiện cách ly tại nhà"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/f11.jpeg"),
            Image.asset("assets/images/f13.jpeg"),
            Image.asset("assets/images/f12.jpeg"),
            Image.asset("assets/images/f03.png"),
          ],
        ),
      ),
    );
  }
}
