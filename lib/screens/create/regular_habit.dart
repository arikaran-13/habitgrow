import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitgrow/models/goal.dart';
import 'package:habitgrow/screens/create/widgets/icon_list.dart';
import 'package:habitgrow/providers/goal_store.dart';
import 'package:habitgrow/theme.dart';
import 'package:uuid/uuid.dart';

class RegularHabit extends ConsumerStatefulWidget {
  const RegularHabit({super.key});

  @override
  ConsumerState<RegularHabit> createState() => _RegularHabitState();
}

class _RegularHabitState extends ConsumerState<RegularHabit> {
  var createGoalFormKey = GlobalKey<FormState>();
  var selectedColor = AppColors.goalColors[0];
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var service = ref.watch(firestoreServiceProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: createGoalFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Habit Name", style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8),
              // Styled TextFormField
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Habit Name"),
              ),
              const SizedBox(height: 8.0),
              IconList(),
              const SizedBox(height: 8.0),
              Text("Color", style: Theme.of(context).textTheme.labelLarge),
              const SizedBox(height: 8.0),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: AppColors.goalColors.length + 1,
                itemBuilder: (ctx, index) {
                  if (AppColors.goalColors.length == index) {
                    var pickedColor = AppColors.brandColor;
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text(
                                "Pick a Color",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ColorPicker(
                                      pickerColor: pickedColor,
                                      onColorChanged: (color) {
                                        setState(() {
                                          pickedColor = color;
                                        });
                                      },
                                      labelTypes: [],
                                      enableAlpha: false,
                                      paletteType: PaletteType.hueWheel,
                                    ),
                                    SizedBox(height: 8.0),
                                    SizedBox(
                                      width: double.infinity,
                                      child: FilledButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedColor = pickedColor;
                                          });
                                          Navigator.pop(context);
                                        },
                                        style: FilledButton.styleFrom(
                                          backgroundColor:
                                              AppColors.darkBrandColor,
                                        ),
                                        child: Text("Select"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: SweepGradient(
                            colors: const [
                              Colors.red,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.blue,
                              Colors.indigo,
                              Colors.purple,
                              Colors.red, // loop back to red
                            ],
                            startAngle: 0.0,
                            endAngle: 6.28319, // 2*PI radians = full circle
                          ),
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = AppColors.goalColors[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.goalColors[index],
                        shape: BoxShape.circle,
                        border: selectedColor == AppColors.goalColors[index]
                            ? BoxBorder.all(color: Colors.black, width: 3.0)
                            : BoxBorder.all(color: Colors.transparent),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 8.0),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (createGoalFormKey.currentState!.validate()) {
                      var goal = Goal(
                        id: Uuid().v4(),
                        name: nameController.text,
                        color: selectedColor,
                        status: GoalStatus.active,
                        icon: ref.read(selectedGoalIcon.notifier).state,
                      );
                      service.createGoal(goal);
                      ref.invalidate(selectedGoalIcon);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
