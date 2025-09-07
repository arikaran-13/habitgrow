import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitgrow/providers/goal_store.dart';
import 'package:habitgrow/shared/styled_fluent_icon.dart';
import 'package:habitgrow/theme.dart';

class GoalIcons extends ConsumerStatefulWidget {
  const GoalIcons({super.key});

  @override
  ConsumerState<GoalIcons> createState() => _GoalIconsState();
}

class _GoalIconsState extends ConsumerState<GoalIcons>
    with TickerProviderStateMixin {
  late TabController selectIconTabController;

  @override
  void initState() {
    selectIconTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    selectIconTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var emojiProvider = ref.watch(goalsEmojiProvider);
    var iconProvider = ref.watch(goalIconsProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 82.0,
        automaticallyImplyLeading: false,
        title: Text(
          "Choose Icon",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(64.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Container(
              height: 42.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: AppColors.tabBarBackground,
              ),
              child: TabBar(
                controller: selectIconTabController,
                tabs: [
                  Tab(text: "Icon"),
                  Tab(text: "Emoji"),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: selectIconTabController,
        children: [
          IconGrid(icons: iconProvider),
          IconGrid(icons: emojiProvider),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 16.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconGrid extends ConsumerWidget {
  final List<FluentData> icons;

  const IconGrid({super.key, required this.icons});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIcon = ref.watch(selectedGoalIcon);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        itemCount: icons.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          final item = icons[index];
          final isSelected = selectedIcon == item;

          return GestureDetector(
            onTap: () {
              ref.read(selectedGoalIcon.notifier).state = item;
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? AppColors.brandColor : Colors.transparent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: StyledFluentIcon(fluentData: item),
            ),
          );
        },
      ),
    );
  }
}
