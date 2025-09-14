import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitgrow/models/goal.dart';
import 'package:habitgrow/providers/goal_store.dart';
import 'package:habitgrow/screens/home/widgets/goal_list_tile.dart';
import 'package:habitgrow/theme.dart';

class GoalsList extends ConsumerWidget {
  const GoalsList({required this.goals, super.key});
  final AsyncValue<List<Goal>> goals;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var service = ref.watch(firestoreServiceProvider);
    return goals.when(
      data: (goals) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: goals.length,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Dismissible(
                key: Key(goals[index].id),
                background: _completeGoalBackground(),
                secondaryBackground: _skipGoalBackground(context),
                onDismissed: (direction) => {
                  if (direction == DismissDirection.startToEnd)
                    {
                      service.updateGoal(
                        Goal(
                          id: goals[index].id,
                          name: goals[index].name,
                          color: goals[index].color,
                          status: GoalStatus.completed,
                          icon: goals[index].icon,
                        ),
                      ),
                    },
                  if (direction == DismissDirection.endToStart)
                    {
                      service.updateGoal(
                        Goal(
                          id: goals[index].id,
                          name: goals[index].name,
                          color: goals[index].color,
                          status: GoalStatus.skipped,
                          icon: goals[index].icon,
                        ),
                      ),
                    },
                },
                child: GoalListTile(goal: goals[index]),
              ),
            );
          },
        );
      },
      error: (obj, err) {
        print(err);
        return Text("Something went wrong 😕");
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _completeGoalBackground() {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: AppColors.successAlert,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Icon(Icons.check, color: AppColors.white, size: 40.0),
      ),
    );
  }

  Widget _skipGoalBackground(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.errorAlert,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Skip", style: Theme.of(context).textTheme.displayMedium),
            SizedBox(width: 5.0),
            Icon(
              Icons.arrow_right_alt_sharp,
              size: 40.0,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
