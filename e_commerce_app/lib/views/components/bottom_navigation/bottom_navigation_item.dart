import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final IconData? icon;
  final void Function()? onTap;
  final Color color;

  const BottomNavigationItem({
    super.key,
    this.icon,
    this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 36,
        height: 35,
        child: Icon(
          icon,
          color: color,
          size: 35,
        ),
      ),
    );
  }
}
