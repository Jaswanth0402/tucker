import 'package:flutter/material.dart';
import 'package:tucker/core/utils/string_extension.dart';

import '../../../../core/utils/colors.dart';


class InputWidget extends StatelessWidget {
  final TextInputAction? textInputAction;
  final String? editTextType;
  final String? titles;
  final String? hintText;
  final Widget? prefixIcons;
  final TextEditingController? controller;
  final bool secureTxt;
  final bool enabled;
  final bool? autofocus;
  final Widget? suffixIcons;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final TapRegionCallback? onTapOutside;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? customValidator;
  final GlobalKey<FormState>? formKey;
  final AutovalidateMode? autoValidateMode;

  const InputWidget({
    super.key,
    required this.textInputAction,
    required this.editTextType,
    required this.titles,
     this.prefixIcons,
    this.enabled = true,
    this.onEditingComplete,
    this.customValidator,
    this.focusNode,
    this.autofocus,
    this.onChanged,
    this.onTapOutside,
    this.hintText,
    this.onFieldSubmitted,
    this.secureTxt = false,
    this.suffixIcons,
    this.controller,
    this.formKey,
    this.autoValidateMode,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titles ?? '',
          style: const TextStyle(fontWeight: FontWeight.w600,color: darkBlack,fontSize: 15),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 50,
          child: Opacity(
            opacity: enabled ? 1.0 : 0.5,
            child: TextFormField(
              key: formKey,
              autofocus: autofocus ?? false,
              enabled: enabled,
              focusNode: focusNode,
              onChanged: onChanged,
              onTapOutside: onTapOutside,
              onEditingComplete: onEditingComplete,
              onFieldSubmitted:onFieldSubmitted,
              obscureText: secureTxt,
              textInputAction: textInputAction,
              style: const TextStyle(color:darkBlack),
              controller: controller,
              keyboardType: editTextType?.getTextInput,
              validator: (value) {
                if (customValidator != null) {
                  return customValidator!(value);
                }
                return editTextType!.getValidation(value);
              },
              autovalidateMode: autoValidateMode,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle:const TextStyle(color: darkBlack),
                  isDense: true,
                
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color:darkBlack),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color:darkBlack),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5,color: darkBlack),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color:primaryColor),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 1.5, color: primaryColor),
                  ),
                  errorStyle: const TextStyle(
                    color: primaryColor,
                  ),
                  prefixIcon: prefixIcons,
                  suffixIcon: suffixIcons),
            ),
          ),
        ),
      ],
    );
  }
}