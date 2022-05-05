import 'package:flutter/material.dart';

import '../../../core/styles.dart';

class ArrowsWidget extends StatelessWidget {
  final bool turnOnRight;

  const ArrowsWidget({Key? key, required this.turnOnRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildArrow(isRight: false, turnOn: !turnOnRight),
        const SizedBox(width: kDefaultMargin),
        _buildArrow(isRight: true, turnOn: turnOnRight),
      ],
    );
  }

  Widget _buildArrow({required final bool isRight, required final turnOn}) {
    const disabledColor = Color(0xFFD3D4D5);

    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: turnOn ? kAccentColor : disabledColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        isRight
            ? Icons.arrow_forward_ios_outlined
            : Icons.arrow_back_ios_outlined,
        color: Colors.white,
        size: 20.0,
      ),
    );
  }
}
