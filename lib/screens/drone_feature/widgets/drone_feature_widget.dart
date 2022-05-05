import 'package:flutter/material.dart';

import '../../../core/styles.dart';
import '../../../model/drone_feature.dart';

class DroneFeatureWidget extends StatelessWidget {
  final DroneFeature droneFeature;

  const DroneFeatureWidget({Key? key, required this.droneFeature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultMargin),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(kDefaultMargin),
            decoration: const BoxDecoration(
              color: kBackgroundButtonColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              droneFeature.icon,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(droneFeature.title, style: kSubTitleTextStyle),
                Text(
                  droneFeature.subtitle,
                  style: kNormalTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
