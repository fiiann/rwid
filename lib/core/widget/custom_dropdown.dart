import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/domain/model/generic_handler.dart';
import 'package:rwid/core/extention/context_ext.dart';

typedef DynamicVoidCallback = void Function(dynamic);

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    required this.options,
    required this.title,
    required this.name,
    required this.hintText,
    this.value,
    this.valueString = 1,
    super.key,
    this.isRequired = true,
    this.enabled = true,
    this.onChanged,
  });
  final List<T> options;
  final String title;
  final String hintText;
  final String name;
  final T? value;
  final bool isRequired;
  final int valueString;
  final DynamicVoidCallback? onChanged;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<T>(
      name: name,
      initialValue: value,
      validator: FormBuilderValidators.compose([
        if (isRequired) FormBuilderValidators.required<dynamic>(),
      ]),
      onChanged: onChanged,
      builder: (FormFieldState<dynamic> field) {
        return InputDecorator(
          decoration: InputDecoration(
            errorText: field.errorText,
            border: InputBorder.none,
          ),
          child: GestureDetector(
            onTap: () async {
              if (enabled) {
                final result = await context.showDropdownBottomsheet<T>(
                  options: options,
                  title: title,
                  valueString: valueString,
                );
                if (result != null) {
                  field.didChange(result);
                }
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomColors.lightPrimaryMain,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: CustomColors.lightTextDisabled,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 3, bottom: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            field.value == null
                                ? hintText
                                : GenericHandler(
                                    field.value,
                                  ).getStringValue,
                            style: TextStyle(
                              color: field.value == null
                                  ? CustomColors.lightTextDisabled
                                  : Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (!enabled)
                          const SizedBox.shrink()
                        else
                          const Expanded(
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: CustomColors.lightTextDisabled,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
