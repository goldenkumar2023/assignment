import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: GestureDetector(
          onDoubleTap: () {
            Fluttertoast.showToast(
              msg: "Sucessfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.amber,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Text(
            'Home',
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
