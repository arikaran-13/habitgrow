import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter/material.dart';
import 'package:habitgrow/shared/styled_fluent_icon.dart';

class GoalListTile extends StatelessWidget {
  const GoalListTile({
    super.key,
    this.fluentData,
    required this.goalName,
    required this.color,
  });

  final FluentData? fluentData;
  final String goalName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color,
      ),
      child: Row(
        children: [
          if (fluentData != null) StyledFluentIcon(fluentData: fluentData!),
          Expanded(
            child: Text(
              goalName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
