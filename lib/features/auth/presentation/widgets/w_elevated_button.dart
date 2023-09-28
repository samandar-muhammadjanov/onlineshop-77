import 'package:flutter/material.dart';

class WElevatedButton extends StatelessWidget {
  const WElevatedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.color = Colors.blue});
  final VoidCallback onPressed;
  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: color,
        backgroundColor: color,
        minimumSize: const Size(double.maxFinite, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
