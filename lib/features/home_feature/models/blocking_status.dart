class BlockingStatus {
  final bool iBlockedThem;
  final bool theyBlockedMe;

  BlockingStatus({
    required this.iBlockedThem,
    required this.theyBlockedMe,
  });

  bool get isBlocked => iBlockedThem || theyBlockedMe;
  bool get canSendMessage => !isBlocked;
}
