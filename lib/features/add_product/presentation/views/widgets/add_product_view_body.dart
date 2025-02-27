import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entites/product_input_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_checkbox.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_orgainc_checkbox.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, code, description;
  late num price, expiryLimit, numberOfCalories, unitAmount;
  late File? image;
  bool isFeatured = false;
  bool isOrganic = false;

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
              CustomTextFormField(
                hintText: 'مدة الصلاحية',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  expiryLimit = num.parse(value!);
                },
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'عدد السعرات',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  numberOfCalories = num.parse(value!);
                },
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: 'عدد الوحدات',
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  unitAmount = num.parse(value!);
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
                height: 16,
              ),
              IsOrganicCheckBox(onChecked: (value) {
                isOrganic = value;
              }),
              SizedBox(
                height: 24,
              ),
              CustomButton(
                text: 'إضافة المنتج',
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ProductInputEntity input = ProductInputEntity(
                        reviews: [],
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: image!,
                        isFeatured: isFeatured,
                        expiryLimit: expiryLimit.toInt(),
                        numberOfCalories: numberOfCalories.toInt(),
                        unitAmount: unitAmount.toInt(),
                        isOrganic: isOrganic,
                      );
                      context.read<AddProductCubit>().addProduct(input);
                    } else {
                      autovalidateMode = AutovalidateMode.onUserInteraction;
                    }
                  } else {
                    showError(context);
                  }
                },
              ),
              SizedBox(
                height: 16,
              )
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
