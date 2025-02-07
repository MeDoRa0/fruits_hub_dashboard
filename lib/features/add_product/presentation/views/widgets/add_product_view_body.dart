import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/domain/entites/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_checkbox.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price;
  late File? image;
  bool isFeatured = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'إسم المنتج',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  name = value!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'سعر المنتج',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  price = num.parse(value!);
                },
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'كود المنتج',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'وصف المنتج',
                keyboardType: TextInputType.text,
                maxLines: 5,
                onSaved: (value) {
                  description = value!;
                },
              ),
              SizedBox(
                height: 16,
              ),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(
                height: 16,
              ),
              IsFeaturedCheckBox(
                onChecked: (value) {
                  isFeatured = value;
                },
              ),
              SizedBox(
                height: 24,
              ),
              CustomButton(
                text: 'إضافة المنتج',
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                          name: name,
                          code: code,
                          description: description,
                          price: price,
                          image: image!,
                          isFeatured: isFeatured);
                    } else {
                      autovalidateMode = AutovalidateMode.onUserInteraction;
                    }
                  } else {
                    showError(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('يجب إختيار صورة للمنتج'),
        backgroundColor: Colors.red,
      ),
    );
  }
}
