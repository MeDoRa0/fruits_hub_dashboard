import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;

  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool isOrganicItem = false;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomCheckbox(
        isChecked: isOrganicItem,
        onChecked: (value) {
          isOrganicItem = value;
          widget.onChecked(isOrganicItem);
          setState(() {});
        },
      ),
      SizedBox(
        width: 16,
      ),
      Text(
        'تحديد كعنصر عضوي',
        style: AppTextStyle.font13w600,
      ),
    ]);
  }
}
