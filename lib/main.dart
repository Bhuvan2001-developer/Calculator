import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "BS Calc",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 45.0),
                ),
              ),
            ),
            Row(
              children: [
                custombtn("9"),
                custombtn("8"),
                custombtn("7"),
                custombtn("+"),
              ],
            ),
            Row(
              children: [
                custombtn("6"),
                custombtn("5"),
                custombtn("4"),
                custombtn("-"),
              ],
            ),
            Row(
              children: [
                custombtn("1"),
                custombtn("2"),
                custombtn("3"),
                custombtn("x"),
              ],
            ),
            Row(
              children: [
                custombtn("C"),
                custombtn("0"),
                custombtn("="),
                custombtn("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget custombtn(String num) {
    return Expanded(
      child: OutlineButton(
        color: Colors.green,
        splashColor: Colors.green,
        padding: EdgeInsets.all(25.0),
        hoverColor: Colors.green,
        onPressed: () {
          btnclicked("$num");
        },
        child: Text(
          "$num",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  String res, text = "";
  int fir, sec;
  String opp;

  void btnclicked(String btntext) {
    if (btntext == "C") {
      res = "";
      text = "";
      sec = 0;
      fir = 0;
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "x" ||
        btntext == "/") {
      fir = int.parse(text);
      res = "";
      opp = btntext;
    } else if (btntext == "=") {
      sec = int.parse(text);
      if (opp == "+") {
        res = (fir + sec).toString();
      }
      if (opp == "x") {
        res = (fir * sec).toString();
      }
      if (opp == "/") {
        res = (fir ~/ sec).toString();
      }
      if (opp == "-") {
        res = (fir - sec).toString();
      }
    } else {
      res = int.parse(text + btntext).toString();
    }

    setState(() {
      text = res;
    });
  }
}
