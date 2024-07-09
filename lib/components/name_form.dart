import 'package:app_form/components/custom_text_field.dart';
import 'package:app_form/components/form_heading.dart';
import 'package:app_form/components/form_wrapper.dart';
import 'package:app_form/utils/constants.dart';
import 'package:app_form/utils/validators.dart';
import 'package:flutter/material.dart';

class NameForm extends StatefulWidget {
  const NameForm({super.key, required this.onSubmitted});
  final void Function(String) onSubmitted;

  @override
  State<NameForm> createState() => _NameFormState();
}

class _NameFormState extends State<NameForm> {
  final _nameFormKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final secondNameController = TextEditingController();
  final firstLastnameController = TextEditingController();
  final secondLastnameController = TextEditingController();

  bool enabled = true;

  void onSubmitForm() {
    if (_nameFormKey.currentState!.validate()) {
      String fullName =
          "Nombre: ${nameController.text} ${secondNameController.text} ${firstLastnameController.text} ${secondLastnameController.text}";
      widget.onSubmitted(fullName);
      setState(() {
        enabled = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    secondNameController.dispose();
    firstLastnameController.dispose();
    secondLastnameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
      form: Form(
          key: _nameFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeading(title: "¿Cual es tu nombre?"),
              CustomTextField(
                  textController: nameController,
                  hintText: "Nombre",
                  enabled: enabled,
                  validator: (values) {
                    return textValidator(values, text: "Introduce tu nombre");
                  }),
              const SizedBox(height: defaultPadding / 2),
              CustomTextField(
                textController: secondNameController,
                hintText: "Segundo nombre",
                enabled: enabled,
              ),
              const SizedBox(height: defaultPadding / 2),
              CustomTextField(
                  textController: firstLastnameController,
                  hintText: "Apellido paterno",
                  enabled: enabled,
                  validator: (values) {
                    return textValidator(values,
                        text: "Introduce tu apellido paterno");
                  }),
              const SizedBox(height: defaultPadding / 2),
              CustomTextField(
                textController: secondLastnameController,
                hintText: "Apellido materno",
                enabled: enabled,
                validator: (values) {
                  return textValidator(values,
                      text: "Introduce tu apellido materno");
                },
                textInputAction: TextInputAction.go,
                onSubmittedForm: onSubmitForm,
              ),
            ],
          )),
    );
  }
}
