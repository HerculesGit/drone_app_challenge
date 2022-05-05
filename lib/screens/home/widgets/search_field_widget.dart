import 'package:flutter/material.dart';

import '../../../core/styles.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
}
