import 'package:flutter/material.dart';

class haucovid extends StatefulWidget {
  const haucovid({key}) : super(key: key);

  @override
  State<haucovid> createState() => _haucovidState();
}

class _haucovidState extends State<haucovid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Hậu covid 19"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/haucovid0.jpeg"),
            Image.asset("assets/images/haucovid1.jpeg"),
            Image.asset("assets/images/haucovid2.jpeg"),
            Image.asset("assets/images/haucovid3.jpeg"),
            Image.asset("assets/images/haucovid4.jpeg"),
            Image.asset("assets/images/haucovid5.jpeg"),
            Image.asset("assets/images/haucovid6.jpeg"),
            Image.asset("assets/images/haucovid7.jpeg"),
          ],
        ),
      ),
    );
  }
}
