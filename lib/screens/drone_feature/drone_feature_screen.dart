import 'package:drone_app_challenge/core/paths.dart';
import 'package:drone_app_challenge/core/widgets/primary_button.dart';
import 'package:drone_app_challenge/screens/base_scroll_screen.dart';
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
      //showBottomNavigationBar: true,
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          // image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: _buildDroneImage(),
          ),
          // title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultMargin),
            child: Text(
              'Power & Foldable for Aerial Adventure',
              style: kTitleTextStyle,
            ),
          ),
          // features
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
            child: _buildDroneFeatures(),
          ),

          const SizedBox(height: kDefaultMargin * 3),
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

  Widget _buildDroneImage() {
    return Image.asset('$kAssetsImages/drone_wbg_1.png');
  }

  Widget _buildDroneFeatures() {
    return Column(
        children: droneFeaturesMock
            .map((droneFeature) => _buildFeature(droneFeature))
            .toList());
  }

  Widget _buildFeature(DroneFeature droneFeature) {
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
