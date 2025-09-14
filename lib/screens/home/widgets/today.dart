import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitgrow/screens/home/widgets/custom_divider.dart';
import 'package:habitgrow/providers/goal_store.dart';
import 'package:habitgrow/screens/home/widgets/goals_list.dart';
import 'package:habitgrow/shared/empty_state.dart';

class TodayTab extends ConsumerStatefulWidget {
  const TodayTab({super.key});

  @override
  ConsumerState<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends ConsumerState<TodayTab> {
  @override
  Widget build(BuildContext context) {
    var activeGoals = ref.watch(activeGoalsProvider);
    var skippedGoals = ref.watch(skippedGoalsProvider);
    var completedGoals = ref.watch(completedGoalsProvider);

    bool allEmpty =
        activeGoals.value?.isEmpty == true &&
        skippedGoals.value?.isEmpty == true &&
        completedGoals.value?.isEmpty == true;

    return Scaffold(
      body: allEmpty
          ? const EmptyState(
              icon: FluentUiEmojiIcon(fl: Fluents.flTrophy, h: 100),
              message: "Every big journey begins with a single step 🌿",
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (activeGoals.value?.isNotEmpty == true)
                    GoalsList(goals: activeGoals),

                  if (skippedGoals.value?.isNotEmpty == true) ...[
                    const CustomDivider(dividerText: "Skipped"),
                    GoalsList(goals: skippedGoals),
                  ],

                  if (completedGoals.value?.isNotEmpty == true) ...[
                    const CustomDivider(dividerText: "Completed"),
                    GoalsList(goals: completedGoals),
                  ],
                ],
              ),
            ),
    );
  }
}
