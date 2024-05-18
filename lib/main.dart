import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: CalculatorView(),
    );
  }
}

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  double num1 = 0, num2 = 0, res = 0;

  TextEditingController t1 = TextEditingController(text: '');
  TextEditingController t2 = TextEditingController(text: '');

  doAddition() {
    setState(() {
      num2 = double.parse(t2.text);
      num1 = double.parse(t1.text);
      res = num1 + num2;
    });
  }

  doSubtraction() {
    setState(() {
      num2 = double.parse(t2.text);
      num1 = double.parse(t1.text);
      res = num1 - num2;
    });
  }

  doMultiplication() {
    setState(() {
      num2 = double.parse(t2.text);
      num1 = double.parse(t1.text);
      res = num1 * num2;
    });
  }

  doDivision() {
    setState(() {
      num2 = double.parse(t2.text);
      num1 = double.parse(t1.text);
      res = num1 / num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Corrected line
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 40.0, top: 15.0, left: 40.0, right: 40.0),
        child: Column(
          children: [
            TextField(
              controller: t1,
              decoration: InputDecoration(hintText: 'Enter first number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              controller: t2,
              decoration: InputDecoration(hintText: 'Enter second number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                calcButton('+', Colors.white24, doAddition),
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                calcButton('-', Colors.white24, doSubtraction),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                calcButton('*', Colors.white24, doMultiplication),
                SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                calcButton('/', Colors.white24, doDivision),
              ],
            ),
            SizedBox(height: 20),
            calcButton('=', Colors.orange, () {
              setState(() {
                res = num1 + num2;
              });
            }),
            SizedBox(height: 20),
            Text('Result: $res'),
          ],
        ),
      ),
    );
  }
}

Widget calcButton(
  String buttonText, Color buttonColor, void Function() buttonPressed) {
    return Container(
      width: 75,
      height: buttonText == '=' ? 150 : 70,
      padding: const EdgeInsets.all(0),
      child: ElevatedButton(
        onPressed: buttonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: const RoundedRectangleBorder(
              borderRadius:BorderRadius.all(Radius.circular(20))),
        ),
        child: Text(buttonText,
          style: const TextStyle(fontSize: 27, color: Colors.white),
        ),
      ),
    );
  }