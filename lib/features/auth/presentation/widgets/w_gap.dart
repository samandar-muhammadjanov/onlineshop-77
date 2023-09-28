import 'package:flutter/material.dart';

class WGap extends StatelessWidget {
  const WGap({super.key, this.height, this.width});
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
