import 'package:flutter/material.dart';

import '../styles.dart';

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool smallButton;

  const PrimaryButton({
    Key? key,
    this.smallButton = false,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: kDefaultMargin, horizontal: kDefaultMargin * 1.1),
        child: Text(text,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
              color: Colors.white,
            )),
      ),
    );
  }
}
