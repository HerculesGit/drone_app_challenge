import 'package:flutter/material.dart';

import '../core/styles.dart';
import '../core/widgets/bottom_nav_bar.dart';

class BaseScrollScreen extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  final bool showBottomNavigationBar;

  const BaseScrollScreen({
    Key? key,
    required this.child,
    this.backgroundColor = kBackgroundColor,
    this.showBottomNavigationBar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewPadding.top;

    maxHeight = maxHeight - MediaQuery.of(context).viewPadding.bottom;

    maxHeight -= kBottomNavHeight;
    //maxHeight -= kBottomNavMarginTop;

    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Scaffold(
          // resizeToAvoidBottomPadding: false, // this avoids the overflow error
          resizeToAvoidBottomInset: (showBottomNavigationBar) ? false : true,
          backgroundColor: backgroundColor,
          body: (!showBottomNavigationBar)
              ? _buildBody()
              : Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: maxHeight,
                      ),
                      child: _buildBody(),
                    ),
                    //SizedBox(height: kBottomNavMarginTop),
                    const BottomNavBarWidget(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildBody() => LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: child,
            ),
          );
        },
      );
}
