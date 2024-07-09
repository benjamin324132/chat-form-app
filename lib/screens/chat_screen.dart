import 'package:app_form/components/birthdate_form.dart';
import 'package:app_form/components/contact_form.dart';
import 'package:app_form/components/custom_button.dart';
import 'package:app_form/components/name_form.dart';
import 'package:app_form/components/response_message.dart';
import 'package:app_form/utils/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<String> finalInfo = [];
  int index = 0;
  List<Widget> chatElements = [];
  late List<Widget> forms = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    setState(() {
      forms = [
        NameForm(onSubmitted: onAddData),
        BirthdateForm(onSubmitted: onAddData),
        ContactForm(onSubmitted: onAddData),
        CustomButton(onPressed: onFinishChat, text: "Iniciar"),
      ];
      chatElements.add(forms[index]);
    });
  }

  void onAddData(String value) {
    index++;
    chatElements.add(ResponseMessage(text: value));
    chatElements.add(forms[index]);
    finalInfo.add(value);
    setState(() {});
    _scrollDown();
  }

  void onFinishChat() {
    _scrollDown();
    if (finalInfo.isNotEmpty) {
      String str = "";
      for (final s in finalInfo) {
        str += "$s \n";
      }
      chatElements.add(ResponseMessage(text: str));
      setState(() {
        str = "";
        finalInfo = [];
      });
      _scrollDown();
    }
  }

  void _scrollDown() async {
    await Future.delayed(const Duration(seconds: 1));
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Form"),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children:
                List.generate(chatElements.length, (i) => chatElements[i]),
          ),
        ),
      ),
    );
  }
}
