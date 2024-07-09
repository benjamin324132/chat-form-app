import 'package:app_form/components/custom_text_field.dart';
import 'package:app_form/components/form_heading.dart';
import 'package:app_form/components/form_wrapper.dart';
import 'package:app_form/utils/constants.dart';
import 'package:app_form/utils/validators.dart';
import 'package:flutter/material.dart';

class BirthdateForm extends StatefulWidget {
  const BirthdateForm({super.key, required this.onSubmitted});
  final void Function(String) onSubmitted;
  @override
  State<BirthdateForm> createState() => _BirthdateFormState();
}

class _BirthdateFormState extends State<BirthdateForm> {
  final _birthdateFormKey = GlobalKey<FormState>();

  final dayController = TextEditingController();
  final monthController = TextEditingController();
  final yearController = TextEditingController();

  bool enabled = true;

  void onSubmitForm() {
    if (_birthdateFormKey.currentState!.validate()) {
      String fullBirthdate =
          "Fecha de nacimiento: ${dayController.text} de ${monthController.text} de ${yearController.text}";
      widget.onSubmitted(fullBirthdate);
      setState(() {
        enabled = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
      form: Form(
          key: _birthdateFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeading(title: "¿Cual es tu fecha de nacimiento?"),
              CustomTextField(
                  textController: dayController,
                  hintText: "Dia",
                  enabled: enabled,
                  inputType: TextInputType.number,
                  validator: dayValidator),
              const SizedBox(height: defaultPadding / 2),
              CustomTextField(
                  textController: monthController,
                  hintText: "Mes",
                  enabled: enabled,
                  validator: monthValidator),
              const SizedBox(height: defaultPadding / 2),
              CustomTextField(
                textController: yearController,
                hintText: "Año",
                enabled: enabled,
                inputType: TextInputType.number,
                validator: yearValidator,
                textInputAction: TextInputAction.go,
                onSubmittedForm: onSubmitForm,
              ),
            ],
          )),
    );
  }
}
