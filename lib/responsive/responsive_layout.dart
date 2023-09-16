import 'package:flutter/material.dart';
import 'package:mrclean/dimension/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget WebScreen;
  const ResponsiveLayout(
      {super.key, required this.mobileScreen, required this.WebScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > webScreenSize) {
        return WebScreen;
      }
      return mobileScreen;
    });
  }
}
