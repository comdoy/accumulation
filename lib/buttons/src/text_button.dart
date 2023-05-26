import 'package:accumulation/consts/src/globals.dart';
import 'package:flutter/material.dart';

TextStyle buttonStyle =
    const TextStyle(fontSize: 18, color: Color.fromARGB(255, 145, 92, 51));

class AllTextButton extends StatelessWidget {
  const AllTextButton(
      {super.key, required this.onPressed, required this.data, this.style});
  final VoidCallback onPressed;
  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFFE8E8E8)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Globals.pad8),
            ),
          ),
          padding: MaterialStateProperty.all(Globals.symmetricBt),
          minimumSize: MaterialStateProperty.all(const Size(0, 0)),
          maximumSize: MaterialStateProperty.all(const Size(375.0, 36.0)),
        ),
        child: Text(
          data,
          style: style ?? buttonStyle,
        ));
  }
}
