import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'constraints.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var userinput = '';
  var result = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    userinput.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    result.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        title: "AC",
                        onpress: () {
                          userinput = "";
                          result = "";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "Back",
                        onpress: () {
                          userinput =
                              userinput.substring(0, userinput.length - 1);
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "%",
                        onpress: () {
                          userinput += "%";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "/",
                        onpress: () {
                          userinput += "/";
                          setState(() {});
                        },
                        color: Colors.amber,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        title: "7",
                        onpress: () {
                          userinput += "7";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "8",
                        onpress: () {
                          userinput += "8";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "9",
                        onpress: () {
                          userinput += "9";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "X",
                        onpress: () {
                          userinput += "*";
                          setState(() {});
                        },
                        color: Colors.amber,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        title: "4",
                        onpress: () {
                          userinput += "4";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "5",
                        onpress: () {
                          userinput += "5";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "6",
                        onpress: () {
                          userinput += "6";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "-",
                        onpress: () {
                          userinput += "-";
                          setState(() {});
                        },
                        color: Colors.amber,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        title: "1",
                        onpress: () {
                          userinput += "1";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "2",
                        onpress: () {
                          userinput += "2";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "3",
                        onpress: () {
                          userinput += "3";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "+",
                        onpress: () {
                          userinput += "+";
                          setState(() {});
                        },
                        color: Colors.amber,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        title: "0",
                        onpress: () {
                          userinput += "0";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: ".",
                        onpress: () {
                          userinput += ".";
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "DEL",
                        onpress: () {
                          userinput =
                              userinput.substring(0, userinput.length - 1);
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: "=",
                        onpress: () {
                          equalPress();
                          setState(() {});
                        },
                        color: Colors.amber,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void equalPress() {
    // String finaluserinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(userinput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);

    result = eval.toString();
  }
}
