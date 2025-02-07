import 'package:flutter/material.dart';

class ImageField extends StatelessWidget {
  const ImageField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Icon(
          Icons.image_outlined,
          size: 180,
        ),
      ),
    );
  }
}
