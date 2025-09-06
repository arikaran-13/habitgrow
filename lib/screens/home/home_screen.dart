import 'package:flutter/material.dart';
import 'package:habitgrow/screens/create/create_goal_screen.dart';
import 'package:habitgrow/screens/home/widgets/today.dart';
import 'package:habitgrow/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12.0),
          child: Text("Home", style: Theme.of(context).textTheme.headlineLarge),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(57),
          child: Padding(
            padding: EdgeInsets.only(
              left: 24.0,
              top: 16.0,
              bottom: 16.0,
              right: 24.0,
            ),
            child: Container(
              height: 42.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.tabBarBackground,
              ),
              child: TabBar(
                controller: tabController,
                tabs: [Text('Today'), Text('Weekly'), Text('Overall')],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          TodayTab(),
          Center(child: Text("Weekly goals")),
          Center(child: Text("Overall goals")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => CreateGoal()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
