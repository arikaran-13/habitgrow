import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    var goalsProvider = ref.watch(todayGoalsProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: Column(
          children: [
            goalsProvider.when(
              data: (goals) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: goals.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Dismissible(
                          key: Key(goals[index].id),
                          onDismissed: (direction) => {},
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
