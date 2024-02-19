import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rwid/core/constant/colors.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({
    required this.name,
    super.key,
    this.image,
    this.label,
    this.required = false,
  });
  final String name;
  final String? image;
  final bool required;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(
      name: name,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: 'Ambil Foto',
      ),
      validator: FormBuilderValidators.compose([
        if (required) FormBuilderValidators.required(),
      ]),
      showDecoration: false,
      placeholderWidget: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: CustomColors.lightTextDisabled,
            width: 2, // Optional: Set border width
          ),
        ),
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.image_rounded,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                label ?? 'Foto',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      transformImageWidget: (context, displayImage) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.antiAlias,
        child: SizedBox.expand(
          child: displayImage,
        ),
      ),
      maxImages: 1,
      previewAutoSizeWidth: false,
      /*initialValue: image == null
          ? null
          : [
        getUrlImage(image),
      ],*/
    );
  }
}
