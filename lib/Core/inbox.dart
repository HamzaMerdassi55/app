import 'package:flutter/material.dart';
class Inbox extends StatefulWidget {
  const Inbox({super.key});

  @override
  State<Inbox> createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(221, 156, 89, 89),
    );
  }
}