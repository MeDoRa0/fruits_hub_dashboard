import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox(
      {super.key, required this.isChecked, required this.onChecked});

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        //height: 24,
        // width: 24,
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.50,
              color: isChecked ? Colors.transparent : Color(0xFFDCDEDE),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : SizedBox(width: 24, height: 24),
      ),
    );
  }
}
