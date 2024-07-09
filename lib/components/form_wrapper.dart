import 'package:app_form/utils/constants.dart';
import 'package:flutter/material.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({super.key, required this.form});
  final Widget form;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LimitedBox(
          maxWidth: size.width * .80,
          child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(color: Colors.grey[200],borderRadius:const BorderRadius.all(Radius.circular(8))),
              child: form),
        ),
      ],
    );
  }
}
