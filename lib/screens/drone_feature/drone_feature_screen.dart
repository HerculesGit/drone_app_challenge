import 'package:drone_app_challenge/core/paths.dart';
import 'package:drone_app_challenge/core/widgets/primary_button.dart';
import 'package:drone_app_challenge/screens/base_scroll_screen.dart';
import 'package:drone_app_challenge/screens/drone_feature/widgets/drone_feature_widget.dart';
import 'package:drone_app_challenge/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../core/router/nav_router.dart';
import '../../core/styles.dart';
import '../../model/drone_feature.dart';

class DroneFeatureScreen extends StatelessWidget {
  const DroneFeatureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScrollScreen(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final rightDronePosition = MediaQuery.of(context).size.width * 0.4;
    return IntrinsicHeight(
      child: Column(
        children: [
          // image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Image.asset(
              '$kAssetsImages/drone_wbg_1.png',
              //fit: BoxFit.fitWidth,
            ),
          ),
          // title
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultMargin),
                  child: Text(
                    'Power & Foldable for Aerial Adventure',
                    style: kTitleTextStyle,
                  ),
                ),
                // features
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultMargin),
                  child: _buildDroneFeatures(),
                ),
              ],
            ),
          ),

          const SizedBox(height: kLargeMargin),
          PrimaryButton(
              text: 'Getting Started',
              onPressed: () {
                NavRouter.toOffAll(context, page: const HomeScreen());
              }),
          const SizedBox(height: kDefaultMargin),
        ],
      ),
    );
  }

  Widget _buildDroneFeatures() {
    return Column(
        children: droneFeaturesMock
            .map((droneFeature) =>
                DroneFeatureWidget(droneFeature: droneFeature))
            .toList());
  }
}
