import 'package:drone_app_challenge/core/models/drone.model.dart';
import 'package:drone_app_challenge/core/styles.dart';
import 'package:drone_app_challenge/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class DroneDetailsScreen extends StatelessWidget {
  final DroneModel droneModel;

  const DroneDetailsScreen({Key? key, required this.droneModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: kDefaultMargin),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
              child: _buildBackArrow(),
            ),
            // const SizedBox(width: kDefaultMargin),
            _buildDroneBasicInfo(),
          ],
        ),
        const SizedBox(height: kLargeMargin),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kLargeMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTabBarPage(title: "Specifications", isCurrentPage: true),
              _buildTabBarPage(title: "Flight History"),
            ],
          ),
        ),
        Expanded(
          child: _buildPages(context),
        ),
      ],
    );
  }

  Widget _buildBackArrow() {
    return Container(
      padding: const EdgeInsets.all(kDefaultMargin),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: kBackgroundButtonColor, width: 2.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(kSmallMargin),
        decoration: const BoxDecoration(
          color: kBlackColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
      ),
    );
  }

  Widget _buildPages(BuildContext context) {
    return PageView(
      children: [
        _buildSpecificationPage(droneModel.specification),
        Container(),
      ],
    );
  }

  Widget _buildTabBarPage(
          {required String title, bool isCurrentPage = false}) =>
      Column(
        children: [
          Text(title,
              style: kSubTitleTextStyle.copyWith(
                color: isCurrentPage
                    ? kSubTitleTextStyle.color
                    : kUnselectedButtonBarColor,
              )),
          const SizedBox(height: kSmallMargin),
          Container(
              height: 5.0,
              width: 25.0,
              decoration: BoxDecoration(
                color: isCurrentPage ? kAccentColor : Colors.transparent,
                borderRadius: BorderRadius.circular(4.0),
              )),
          const SizedBox(height: kLargeMargin),
        ],
      );

  Widget _buildDroneBasicInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          droneModel.name,
          style: kTitleTextStyle.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: kSmallMargin),
        if (droneModel.containsBattery)
          Text(
            '${droneModel.batteryLifeCycle!.chargePercentage}% Battery Left',
          ),
      ],
    );
  }

  Widget _buildSpecificationPage(Specification specification) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kLargeMargin),
          child: Column(
            children: [
              Row(
                children: [
                  _buildProperty(
                      icon: Icons.camera_alt,
                      title: "Video Quality",
                      subtitle: specification.videoQuality),

                  _buildProperty(
                      icon: Icons.compare_arrows_rounded,
                      title: "Transmission",
                      subtitle: specification.transmission),
                  // Container(),
                ],
              ),
              const SizedBox(height: kLargeMargin),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildProperty(
                      icon: Icons.whatshot,
                      title: "Flight Time",
                      subtitle: specification.flightTime),
                  _buildProperty(
                      icon: Icons.videocam,
                      title: "Hyperlapse",
                      subtitle: specification.hyperlapse),
                  // Container(),
                ],
              ),
              const SizedBox(height: kDefaultMargin),
            ],
          ),
        ),
        Flexible(child: Image.asset(droneModel.imageUrl)),
        const SizedBox(height: kLargeMargin),
        PrimaryButton(text: 'Fly Now', onPressed: () {}),
        const SizedBox(height: kDefaultMargin),
      ],
    );
  }

  Widget _buildProperty(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: kBackgroundButtonColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(icon, color: Colors.black),
          ),
          const SizedBox(width: 8.0),
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
