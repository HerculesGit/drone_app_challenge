import 'package:drone_app_challenge/core/styles.dart';
import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kLargeMargin),
      height: kBottomNavHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavItem(Icons.home, selected: true),
          _buildNavItem(Icons.archive),
          _buildNavItem(Icons.perm_contact_calendar_rounded),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, {bool selected = false}) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selected
            ? Border.all(
                color: kBackgroundButtonColor,
                width: 2,
              )
            : null,
      ),
      child: Icon(
        icon,
        size: kBottomNavHeight * .65,
        color: selected ? kAccentColor : kUnselectedButtonBarColor,
      ),
    );
  }
}
