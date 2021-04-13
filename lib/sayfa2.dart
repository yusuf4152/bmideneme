import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Sayfa2 extends StatefulWidget {
  final double bmi;

  const Sayfa2({Key key, this.bmi}) : super(key: key);
  @override
  _Sayfa2State createState() => _Sayfa2State();
}

class _Sayfa2State extends State<Sayfa2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF92D3),
      appBar: AppBar(
        backgroundColor: Color(0xFFFF92D3),
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 60.0),
          child: Text("BMI sonuç"),
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Text(
              "BMI",
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 80.0, left: 80.0),
            child: Container(
              width: 100.0,
              height: 180.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Vücut kitle endeksiniz",
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("${widget.bmi}",
                      style: TextStyle(fontSize: 24.0, color: Colors.black)),
                  SizedBox(
                    height: 10.0,
                  ),
                  textrenk(widget.bmi),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 90.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Image.network(
              "https://media.istockphoto.com/vectors/creative-vector-illustration-of-bmi-body-mass-index-infographic-chart-vector-id1136878857?s=612x612",
              fit: BoxFit.cover,
              height: 160.0,
              scale: 180.0,
            ),
          ),
        ],
      ),
    );
  }

  Text textrenk(double bmi) {
    if (bmi < 18.0) {
      return Text(
        "zayıfsınız",
        style: TextStyle(color: Color(0xFF5BBCE6), fontSize: 20.0),
      );
    } else if (bmi < 25) {
      return Text(
        "normal kilodasınız",
        style: TextStyle(color: Color(0xFFA1B33B), fontSize: 20.0),
      );
    } else if (bmi < 30.0) {
      return Text(
        "fazla kilolusunuz",
        style: TextStyle(color: Color(0xFFF68122), fontSize: 20.0),
      );
    } else if (bmi < 35) {
      return Text(
        "obezsiniz",
        style: TextStyle(color: Color(0xFFE74536), fontSize: 20.0),
      );
    } else {
      return Text(
        "fazla obezsiniz",
        style: TextStyle(color: Color(0xFFBF3A8B), fontSize: 20.0),
      );
    }
  }
}
