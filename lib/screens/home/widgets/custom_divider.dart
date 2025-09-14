import 'package:flutter/material.dart';
import 'package:habitgrow/theme.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({required this.dividerText, super.key});

  final dividerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 14.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Row(
            children: [
              Text(
                "$dividerText",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Divider(thickness: 0.2, color: AppColors.liteGrey),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
