import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/custom_checkbox.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChecked});
  final ValueChanged<bool> onChecked;

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isFeaturedIteam = false;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CustomCheckbox(
        isChecked: isFeaturedIteam,
        onChecked: (value) {
          isFeaturedIteam = value;
          widget.onChecked(isFeaturedIteam);
          setState(() {});
        },
      ),
      SizedBox(
        width: 16,
      ),
      Text(
        'تحديد كعنصر مميز',
        style: AppTextStyle.font13w600,
      ),
    ]);
  }
}
