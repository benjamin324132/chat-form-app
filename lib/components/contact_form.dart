import 'package:app_form/components/custom_text_field.dart';
import 'package:app_form/components/form_heading.dart';
import 'package:app_form/components/form_wrapper.dart';
import 'package:app_form/utils/constants.dart';
import 'package:app_form/utils/validators.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key, required this.onSubmitted});
  final void Function(String) onSubmitted;
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _contactFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  bool enabled = true;

  void onSubmitForm() {
    if (_contactFormKey.currentState!.validate()) {
      String fullContact =
          "Correo electronico: ${emailController.text} \n Telefono celular: ${phoneController.text}";
      widget.onSubmitted(fullContact);
      setState(() {
        enabled = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormWrapper(
      form: Form(
          key: _contactFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormHeading(title: "Datos de contacto"),
              CustomTextField(
                  textController: emailController,
                  hintText: "Email",
                  enabled: enabled,
                  inputType: TextInputType.emailAddress,
                  textCapitalization: TextCapitalization.none,
                  validator: emailValidator),
              const SizedBox(height: defaultPadding / 2),
              CustomTextField(
                textController: phoneController,
                hintText: "Telefono",
                enabled: enabled,
                inputType: TextInputType.phone,
                validator: phoneValidator,
                textInputAction: TextInputAction.go,
                onSubmittedForm: onSubmitForm,
              ),
            ],
          )),
    );
  }
}
