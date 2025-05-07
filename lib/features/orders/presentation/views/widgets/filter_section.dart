import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/text_styles.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement filter functionality here
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'تصفية الطلبيات',
            style: AppTextStyle.font16Bold,
          ),
          SizedBox(
            width: 16,
          ),
          Icon(Icons.filter_list),
        ],
      ),
    );
  }
}
