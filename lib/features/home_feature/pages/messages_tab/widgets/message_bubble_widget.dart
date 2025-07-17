import 'package:flutter/cupertino.dart';
import 'package:relative_choice/core/utils/appsnackbar.dart';
import 'package:relative_choice/features/home_feature/pages/messages_tab/widgets/received_message_bubble.dart';

import '../../../models/message_model.dart';
import 'flag_message_popup.dart';
import 'own_message_bubble.dart';

class MessageBubbleWidget extends StatefulWidget {
  const MessageBubbleWidget({
    super.key,
    required this.message,
    required this.isOwnMessage,
    this.onFlagPopupChanged,
  });
  final MessageModel message;
  final bool isOwnMessage;
  final void Function(bool isOpen)? onFlagPopupChanged;
  @override
  State<MessageBubbleWidget> createState() => _MessageBubbleWidgetState();
}

class _MessageBubbleWidgetState extends State<MessageBubbleWidget> {
  OverlayEntry? _overlayEntry;

  void _showFlagPopup(TapDownDetails details) {
    final overlay = Overlay.of(context);
    final position = details.globalPosition;

    _overlayEntry = OverlayEntry(
      builder: (context) => FlagMessagePopup(
        position: position,
        onFlag: () {
          _hidePopup();
          Utils.showSnackBar(
              context, "Message flagged and sent to Administrator");
        },
        onDismiss: _hidePopup,
      ),
    );

    overlay.insert(_overlayEntry!);

    widget.onFlagPopupChanged?.call(true);
  }

  void _hidePopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;

    widget.onFlagPopupChanged?.call(false);
  }

  @override
  Widget build(BuildContext context) {
    return switch (widget.isOwnMessage) {
      true => OwnMessageBubble(
          message: widget.message,
        ),
      false => GestureDetector(
          onTapDown: _showFlagPopup,
          onLongPressEnd: (_) => _hidePopup(),
          child: ReceivedMessageBubble(
            message: widget.message,
          ),
        ),
    };
  }
}
