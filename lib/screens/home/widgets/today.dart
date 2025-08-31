import 'package:flutter/material.dart';
import 'package:habitgrow/screens/home/widgets/goal_list_tile.dart';
import 'package:habitgrow/theme.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Scaffold(
        body: GoalListTile(
          icon: Icons.home,
          goalName: "Wake up at 5 am",
          color: AppColors.goalColors[2],
        ),
      ),
    );
  }
}
