import 'package:flutter/cupertino.dart';
import 'package:relative_choice/features/home_feature/pages/messages_tab/widgets/received_message_bubble.dart';

import '../../../models/message_model.dart';
import 'own_message_bubble.dart';

class MessageBubbleWidget extends StatelessWidget {
  const MessageBubbleWidget(
      {super.key, required this.message, required this.isOwnMessage});
  final MessageModel message;
  final bool isOwnMessage;
  @override
  Widget build(BuildContext context) {
    return switch (isOwnMessage) {
      true => OwnMessageBubble(
          message: message,
        ),
      false => ReceivedMessageBubble(
          message: message,
        ),
    };
  }
}
