import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter/material.dart';
import 'package:habitgrow/models/goal.dart';
import 'package:habitgrow/screens/home/widgets/goal_status_icon.dart';
import 'package:habitgrow/shared/styled_fluent_icon.dart';
import 'package:habitgrow/theme.dart';

class GoalListTile extends StatelessWidget {
  const GoalListTile({super.key, required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: goal.color,
      ),
      child: Row(
        children: [
          if (goal.icon != null) StyledFluentIcon(fluentData: goal.icon!),
          Expanded(
            child: Text(
              goal.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Spacer(),
          if (goal.status == GoalStatus.completed)
            GoalStatusIcon(
              iconData: Icons.check,
              color: AppColors.successAlert,
            ),

          if (goal.status == GoalStatus.skipped)
            GoalStatusIcon(
              iconData: Icons.arrow_right_alt_outlined,
              color: AppColors.liteGrey,
            ),
          SizedBox(width: 5.0),
        ],
      ),
    );
  }
}
