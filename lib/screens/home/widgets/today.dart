import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitgrow/models/goal.dart';
import 'package:habitgrow/screens/home/widgets/goal_list_tile.dart';
import 'package:habitgrow/providers/goal_store.dart';
import 'package:habitgrow/theme.dart';

class TodayTab extends ConsumerStatefulWidget {
  const TodayTab({super.key});

  @override
  ConsumerState<TodayTab> createState() => _TodayTabState();
}

class _TodayTabState extends ConsumerState<TodayTab> {
  @override
  Widget build(BuildContext context) {
    var activeGoals = ref.watch(activeGoalsProvider);
    var service = ref.watch(firestoreServiceProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: Column(
          children: [
            activeGoals.when(
              data: (goals) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: goals.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Dismissible(
                          key: Key(goals[index].id),
                          background: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: AppColors.successAlert,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(
                                Icons.check,
                                color: AppColors.white,
                                size: 40.0,
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            decoration: BoxDecoration(
                              color: AppColors.errorAlert,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "Skip",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.displayMedium,
                                  ),
                                  SizedBox(width: 5.0),
                                  Icon(
                                    Icons.arrow_right_alt_sharp,
                                    size: 40.0,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onDismissed: (direction) => {
                            if (direction == DismissDirection.startToEnd)
                              {
                                service.updateGoal(
                                  Goal(
                                    id: goals[index].id,
                                    name: goals[index].name,
                                    color: goals[index].color,
                                    status: GoalStatus.completed,
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
                                  ),
                                ),
                              },
                          },
                          child: GoalListTile(
                            fluentData: goals[index].icon,
                            goalName: goals[index].name,
                            color: goals[index].color,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (obj, err) {
                print(err);
                return Text("Error $err");
              },
              loading: () => CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
