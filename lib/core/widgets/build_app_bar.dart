  import 'package:flutter/material.dart';

import 'package:fruits_hub_dashboard/core/utils/text_styles.dart';

AppBar buildAppBar(String text) {
    return AppBar(
    
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        text,
        style: AppTextStyle.font19Bold.copyWith(color: Colors.black),
      ),
    );
  }