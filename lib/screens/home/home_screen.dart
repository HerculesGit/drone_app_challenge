import 'package:drone_app_challenge/core/paths.dart';
import 'package:drone_app_challenge/core/router/nav_router.dart';
import 'package:drone_app_challenge/core/styles.dart';
import 'package:drone_app_challenge/screens/base_scroll_screen.dart';
import 'package:drone_app_challenge/screens/drone_details/drone_details_screen.dart';
import 'package:flutter/material.dart';

import '../../core/models/drone.model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScrollScreen(
      showBottomNavigationBar: true,
      child: IntrinsicHeight(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: kDefaultMargin),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: _buildHeader(),
        ),
        const SizedBox(height: kLargeMargin),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: Text('Discover this year\'s hottest drone',
              style: kTitleTextStyle),
        ),
        const SizedBox(height: kLargeMargin),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: _buildSearchField(),
        ),
        const SizedBox(height: kLargeMargin),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: RichText(
            text: const TextSpan(
              text: "Popular ",
              style: kSubTitleTextStyle,
              children: [
                TextSpan(text: "Drone", style: kTitleTextStyle),
              ],
            ),
          ),
        ),
        const SizedBox(height: kDefaultMargin),
        _buildHorizontalPopularDrones(context),
      ],
    );
  }

  Widget _buildHorizontalPopularDrones(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        // maxWidth: MediaQuery.of(context).size.width,
        // minWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.width * 0.75,
        minHeight: MediaQuery.of(context).size.width * 0.75,

        // maxHeight: MediaQuery.of(context).size.width
        // minHeight: MediaQuery.of(context).size.width ,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              ListView.builder(
                itemCount: droneModelsMock.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) =>
                    _buildDrone(context, droneModelsMock[index], index),
              ),
              Positioned(
                bottom: 0,
                right: kDefaultMargin,
                child: _buildLeftRightArrow(context,
                    turnOnLeftArrow: false, turnOnRightArrow: true),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDrone(BuildContext context, DroneModel drone, int index) {
    final isFirstDrone = index == 0;
    final containerWidth = MediaQuery.of(context).size.width / 1.8;
    double marginLeft = isFirstDrone ? kDefaultMargin : 0;

    return Container(
      width: isFirstDrone ? null : containerWidth,
      margin: EdgeInsets.only(
        left: marginLeft,
      ),
      padding: EdgeInsets.only(
        bottom: isFirstDrone ? 0 : kDefaultMargin * 3,
        right: kDefaultMargin,
      ),
      child: GestureDetector(
        onTap: () {
          NavRouter.to(context, page: DroneDetailsScreen(droneModel: drone));
        },
        child: Stack(
          // fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kBlackColor,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: kDefaultMargin),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const SizedBox(height: kDefaultMargin),
                        const Icon(Icons.star, color: kAccentColor),
                        const SizedBox(width: 4.0),
                        Text(
                          '4.5',
                          style: kSubTitleTextStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: kDefaultMargin),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Opacity(
                      opacity: isFirstDrone ? 0 : 1,
                      child: Image.asset(drone.imageUrl,
                          fit: BoxFit.cover,
                          width: isFirstDrone
                              ? null
                              : MediaQuery.of(context).size.width),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultMargin),
                    child: Text(drone.name,
                        style: kSubTitleTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultMargin),
                    child: Text(
                      drone.desc,
                      style: kSmallTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: kDefaultMargin),
                ],
              ),
            ),
            if (isFirstDrone)
              Image.asset(
                drone.imageUrl,
                width: containerWidth + 50,
                // height: MediaQuery.of(context).size.width * 0.8,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    const imageSize = 80.0;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image.asset(
            '$kAssetsImages/person.jpg',
            height: imageSize,
            width: imageSize,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: kDefaultMargin),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adila Salon',
              style: kTitleTextStyle.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Premium Customer',
              style: kNormalTextStyle,
            ),
          ],
        ),
        const Spacer(),
        _buildBellIcon(),
      ],
    );
  }

  Widget _buildBellIcon() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
      ),
      child: const Icon(Icons.notifications),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 60.0,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              decoration: BoxDecoration(
                color: kBackgroundButtonColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintText: "Search drone",
                  enabled: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: kDefaultMargin,
                    vertical: kDefaultMargin,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: kDefaultMargin),
          _buildSendIcon(),
        ],
      ),
    );
  }

  Widget _buildSendIcon() {
    const iconSize = 32.0;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(kDefaultMargin),
          decoration: BoxDecoration(
              color: kAccentColor,
              borderRadius: BorderRadius.circular(
                8.0,
              )),
          child:
              const Icon(Icons.whatshot, color: Colors.white, size: iconSize),
        ),
        Positioned(
          right: 0.0,
          child: _buildRod(iconSize * 0.8),
        ),
        Positioned(
          left: 0.0,
          child: _buildRod(iconSize * 0.8),
        )
      ],
    );
  }

  Widget _buildRod(double height) => Container(
        color: Colors.white,
        height: height,
        width: 2.0,
      );

  Widget _buildLeftRightArrow(
    BuildContext context, {
    required bool turnOnLeftArrow,
    required bool turnOnRightArrow,
  }) {
    const disabledColor = Color(0xFFD3D4D5);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: turnOnLeftArrow ? kAccentColor : disabledColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 20.0,
          ),
        ),
        const SizedBox(width: kDefaultMargin),
        Container(
          padding: const EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            color: turnOnRightArrow ? kAccentColor : disabledColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
            size: 20.0,
          ),
        ),
      ],
    );
  }
}
