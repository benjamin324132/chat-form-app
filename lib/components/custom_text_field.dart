import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.enabled = true,
      required this.textController,
      required this.hintText,
      this.inputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.validator,
      this.onSubmittedForm,
      this.textCapitalization = TextCapitalization.words});
  final bool enabled;
  final TextEditingController textController;
  final String hintText;
  final TextInputType inputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final VoidCallback? onSubmittedForm;
  final TextCapitalization textCapitalization;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: textController,
      textInputAction: textInputAction,
      keyboardType: inputType,
      textCapitalization: textCapitalization,
      onFieldSubmitted: (values) {
        if (onSubmittedForm != null) {
          onSubmittedForm!();
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      validator: validator,
    );
  }
}
