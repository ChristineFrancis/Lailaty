import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/Drawer/my_bottom_sheet.dart';
import 'package:lailaty/common%20features/chat/pages/chat_bottom_sheet.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 25),
      decoration: const BoxDecoration(
        color: ColorManager.yellow,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            backgroundColor:
                Colors.transparent, // Makes the background transparent
            builder: (BuildContext context) {
              return ChatBottomSheet();
            },
          );
        },
        icon: const Icon(
          Icons.message_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}
