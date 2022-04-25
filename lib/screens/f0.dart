import 'package:flutter/material.dart';

class f0quydinh extends StatefulWidget {
  const f0quydinh({key}) : super(key: key);

  @override
  State<f0quydinh> createState() => _f0quydinhState();
}

class _f0quydinhState extends State<f0quydinh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Chăm sóc F0 tại nhà"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/f0.png"),
            Image.asset("assets/images/f02.jpeg"),
            Image.asset("assets/images/f03.png"),
          ],
        ),
      ),
    );
  }
}
