import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'إسم المنتج',
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'سعر المنتج',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'كود المنتج',
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'وصف المنتج',
                keyboardType: TextInputType.text,
                maxLines: 5,
              ),
              SizedBox(
                height: 16,
              ),
              ImageField(),
            ],
          ),
        ),
      ),
    );
  }
}
