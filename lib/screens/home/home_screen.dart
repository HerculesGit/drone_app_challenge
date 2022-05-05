import 'package:drone_app_challenge/core/paths.dart';
import 'package:drone_app_challenge/core/styles.dart';
import 'package:drone_app_challenge/screens/base_scroll_screen.dart';
import 'package:drone_app_challenge/screens/home/widgets/popular_drone_widget.dart';
import 'package:drone_app_challenge/screens/home/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../core/models/drone.model.dart';
import 'widgets/arrows_widget.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();

  /// width of the drone at ListView.builder position
  double pieceWidth = 100.0;
  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void setPieceWidth(double containerWidth) {
    pieceWidth = containerWidth;
  }

  @override
  void onInit() {
    scrollController.addListener(() {
      final metrics = scrollController.offset;
      final result = metrics ~/ pieceWidth;

      final scrollingToRight = scrollController.position.userScrollDirection ==
          ScrollDirection.reverse;

      if (scrollingToRight && result > currentIndex.value ||
          !scrollingToRight && result < currentIndex.value) {
        setCurrentIndex(result);
      }
    });
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController controller = Get.put(HomeController());

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultMargin),
          child: SearchFieldWidget(),
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
          // int index = -1;
          return Stack(
            fit: StackFit.expand,
            children: [
              ListView.builder(
                controller: controller.scrollController,
                itemCount: droneModelsMock.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (_, index) =>
                    _buildDrone(context, droneModelsMock[index], index),
              ),

              // SingleChildScrollView(
              //   controller: controller.scrollController,
              //   // itemCount: droneModelsMock.length,
              //   scrollDirection: Axis.horizontal,
              //   // shrinkWrap: true,
              //   // itemBuilder: (_, index) =>
              //   //     _buildDrone(context, droneModelsMock[index], index),
              //   child: Row(
              //     children: droneModelsMock.map((e) {
              //       index++;
              //       return _buildDrone(context, droneModelsMock[index], index);
              //     }).toList(),
              //   ),
              // ),
              const Positioned(
                bottom: 0,
                right: kDefaultMargin,
                child: ArrowsWidget(turnOnRight: true),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDrone(BuildContext context, DroneModel drone, int index) {
    return Obx(() {
      final isFirstDroneAtList = controller.currentIndex.value == index;
      final popularDroneWidth = MediaQuery.of(context).size.width / 1.8;

      controller.setPieceWidth(popularDroneWidth);

      return PopularDroneWidget(
        drone: drone,
        isFirstDroneAtList: isFirstDroneAtList,
        width: popularDroneWidth,
      );
    });
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
}
