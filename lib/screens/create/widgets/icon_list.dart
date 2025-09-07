import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitgrow/screens/create/widgets/goal_icons.dart';
import 'package:habitgrow/providers/goal_store.dart';
import 'package:habitgrow/shared/styled_fluent_icon.dart';
import 'package:habitgrow/theme.dart';

class IconList extends ConsumerWidget {
  const IconList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sampleIconsProvider = ref.watch(sampleFluentIconsProvider);
    var selectedIcon = ref.watch(selectedGoalIcon);
    return Column(
      children: [
        Row(
          children: [
            Text("Icon", style: Theme.of(context).textTheme.labelLarge),
            Spacer(),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  elevation: 10.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                      heightFactor: 0.8,
                      child: GoalIcons(),
                    );
                  },
                );
              },
              child: Row(
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                      color: AppColors.brandColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_right_alt, color: AppColors.brandColor),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sampleIconsProvider.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        ref.read(selectedGoalIcon.notifier).state =
                            sampleIconsProvider[index];
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectedIcon == sampleIconsProvider[index]
                              ? AppColors.brandColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: StyledFluentIcon(
                          fluentData: sampleIconsProvider[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
