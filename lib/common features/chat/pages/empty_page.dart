import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/chat/widgets/chat_button.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('T E S T'),
        centerTitle: true,
      ),
      body: Center(
        child: ChatButton(),
      ),
    );
  }
}