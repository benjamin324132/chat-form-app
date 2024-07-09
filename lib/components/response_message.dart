import 'package:app_form/utils/constants.dart';
import 'package:flutter/material.dart';

class ResponseMessage extends StatelessWidget {
  const ResponseMessage({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LimitedBox(
          maxWidth: size.width * .85,
          child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              margin: const EdgeInsets.symmetric(vertical: defaultPadding),
              decoration: const BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w600),
              )),
        ),
      ],
    );
  }
}
