import 'package:flutter/material.dart';

var style = const TextStyle(
    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  const MyButton(
      {super.key,
      required this.title,
      this.color = Colors.grey,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 80,
          width: 80,  
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Center(
              child: Text(
            title,
            style: style,
          )),
        ),
      ),
    );
  }
}
