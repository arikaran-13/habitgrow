import 'package:flutter/material.dart';
import 'package:habitgrow/screens/create/regular_habit.dart';
import 'package:habitgrow/theme.dart';

class CreateGoal extends StatefulWidget {
  const CreateGoal({super.key});

  @override
  State<CreateGoal> createState() => _CreateGoalState();
}

class _CreateGoalState extends State<CreateGoal> with TickerProviderStateMixin {
  late TabController createGoalTabBarController;

  @override
  void initState() {
    createGoalTabBarController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    createGoalTabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create New Habit",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(57),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 42.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.tabBarBackground,
              ),
              child: TabBar(
                controller: createGoalTabBarController,
                tabs: [Text("Regular Habit"), Text("One-Time Task")],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: createGoalTabBarController,
        children: [RegularHabit(), Text("Create one time task")],
      ),
    );
  }
}
