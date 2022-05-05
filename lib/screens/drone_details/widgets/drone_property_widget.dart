import 'package:flutter/material.dart';

import '../../../core/styles.dart';

class DronePropertyWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const DronePropertyWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(kSmallMargin),
            decoration: BoxDecoration(
              color: kBackgroundButtonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(width: kSmallMargin),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: kSmallTextStyle),
              const SizedBox(height: 4.0),
              Text(subtitle,
                  style:
                      kNormalTextStyle.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
