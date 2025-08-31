import 'package:flutter/material.dart';

class GoalListTile extends StatelessWidget {
  const GoalListTile({
    super.key,
    required this.icon,
    required this.goalName,
    required this.color,
  });

  final IconData icon;
  final String goalName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color,
      ),
      child: Text(goalName, style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
