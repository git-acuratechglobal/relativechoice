class SendMessageParams {
  final String chatId;
  final String senderId;
  final String receiverId;
  final String text;

  SendMessageParams({
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.text,
  });

  List<String> get participants => [senderId, receiverId];
}
