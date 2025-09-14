import 'package:flutter/material.dart';
import 'package:habitgrow/theme.dart';

class GoalStatusIcon extends StatelessWidget {
  const GoalStatusIcon({required this.iconData, required this.color, super.key});

  final IconData iconData;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25.0,
      height: 25.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, color: AppColors.white, size: 20.0),
    );
  }
}
