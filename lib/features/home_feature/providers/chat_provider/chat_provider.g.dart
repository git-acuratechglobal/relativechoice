// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatRoomsHash() => r'f27274a53e3d2646966d0a61aac9b440961068eb';

/// See also [chatRooms].
@ProviderFor(chatRooms)
final chatRoomsProvider = StreamProvider<List<ChatRoom>>.internal(
  chatRooms,
  name: r'chatRoomsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatRoomsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ChatRoomsRef = StreamProviderRef<List<ChatRoom>>;
String _$messageListHash() => r'fd10adc5fb189b93a88100d5eceb4e87cbe22ffd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [messageList].
@ProviderFor(messageList)
const messageListProvider = MessageListFamily();

/// See also [messageList].
class MessageListFamily extends Family<AsyncValue<List<MessageModel>>> {
  /// See also [messageList].
  const MessageListFamily();

  /// See also [messageList].
  MessageListProvider call(
    dynamic chatId,
  ) {
    return MessageListProvider(
      chatId,
    );
  }

  @override
  MessageListProvider getProviderOverride(
    covariant MessageListProvider provider,
  ) {
    return call(
      provider.chatId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'messageListProvider';
}

/// See also [messageList].
class MessageListProvider extends StreamProvider<List<MessageModel>> {
  /// See also [messageList].
  MessageListProvider(
    dynamic chatId,
  ) : this._internal(
          (ref) => messageList(
            ref as MessageListRef,
            chatId,
          ),
          from: messageListProvider,
          name: r'messageListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messageListHash,
          dependencies: MessageListFamily._dependencies,
          allTransitiveDependencies:
              MessageListFamily._allTransitiveDependencies,
          chatId: chatId,
        );

  MessageListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
  }) : super.internal();

  final dynamic chatId;

  @override
  Override overrideWith(
    Stream<List<MessageModel>> Function(MessageListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MessageListProvider._internal(
        (ref) => create(ref as MessageListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
      ),
    );
  }

  @override
  StreamProviderElement<List<MessageModel>> createElement() {
    return _MessageListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessageListProvider && other.chatId == chatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MessageListRef on StreamProviderRef<List<MessageModel>> {
  /// The parameter `chatId` of this provider.
  dynamic get chatId;
}

class _MessageListProviderElement
    extends StreamProviderElement<List<MessageModel>> with MessageListRef {
  _MessageListProviderElement(super.provider);

  @override
  dynamic get chatId => (origin as MessageListProvider).chatId;
}

String _$chatRoomDataHash() => r'c8597ffa468de0274a97550ce90dadb47ec7da1a';

/// See also [chatRoomData].
@ProviderFor(chatRoomData)
const chatRoomDataProvider = ChatRoomDataFamily();

/// See also [chatRoomData].
class ChatRoomDataFamily extends Family<AsyncValue<ChatRoomState>> {
  /// See also [chatRoomData].
  const ChatRoomDataFamily();

  /// See also [chatRoomData].
  ChatRoomDataProvider call(
    dynamic otherUserId,
  ) {
    return ChatRoomDataProvider(
      otherUserId,
    );
  }

  @override
  ChatRoomDataProvider getProviderOverride(
    covariant ChatRoomDataProvider provider,
  ) {
    return call(
      provider.otherUserId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatRoomDataProvider';
}

/// See also [chatRoomData].
class ChatRoomDataProvider extends StreamProvider<ChatRoomState> {
  /// See also [chatRoomData].
  ChatRoomDataProvider(
    dynamic otherUserId,
  ) : this._internal(
          (ref) => chatRoomData(
            ref as ChatRoomDataRef,
            otherUserId,
          ),
          from: chatRoomDataProvider,
          name: r'chatRoomDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatRoomDataHash,
          dependencies: ChatRoomDataFamily._dependencies,
          allTransitiveDependencies:
              ChatRoomDataFamily._allTransitiveDependencies,
          otherUserId: otherUserId,
        );

  ChatRoomDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.otherUserId,
  }) : super.internal();

  final dynamic otherUserId;

  @override
  Override overrideWith(
    Stream<ChatRoomState> Function(ChatRoomDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ChatRoomDataProvider._internal(
        (ref) => create(ref as ChatRoomDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        otherUserId: otherUserId,
      ),
    );
  }

  @override
  StreamProviderElement<ChatRoomState> createElement() {
    return _ChatRoomDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatRoomDataProvider && other.otherUserId == otherUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, otherUserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatRoomDataRef on StreamProviderRef<ChatRoomState> {
  /// The parameter `otherUserId` of this provider.
  dynamic get otherUserId;
}

class _ChatRoomDataProviderElement extends StreamProviderElement<ChatRoomState>
    with ChatRoomDataRef {
  _ChatRoomDataProviderElement(super.provider);

  @override
  dynamic get otherUserId => (origin as ChatRoomDataProvider).otherUserId;
}

String _$getUserModelDataHash() => r'3d937cd9e73d2978ba3bf9dd1da4077d059263cb';

/// See also [getUserModelData].
@ProviderFor(getUserModelData)
const getUserModelDataProvider = GetUserModelDataFamily();

/// See also [getUserModelData].
class GetUserModelDataFamily extends Family<AsyncValue<UserDataModel>> {
  /// See also [getUserModelData].
  const GetUserModelDataFamily();

  /// See also [getUserModelData].
  GetUserModelDataProvider call({
    required String userId,
  }) {
    return GetUserModelDataProvider(
      userId: userId,
    );
  }

  @override
  GetUserModelDataProvider getProviderOverride(
    covariant GetUserModelDataProvider provider,
  ) {
    return call(
      userId: provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getUserModelDataProvider';
}

/// See also [getUserModelData].
class GetUserModelDataProvider
    extends AutoDisposeFutureProvider<UserDataModel> {
  /// See also [getUserModelData].
  GetUserModelDataProvider({
    required String userId,
  }) : this._internal(
          (ref) => getUserModelData(
            ref as GetUserModelDataRef,
            userId: userId,
          ),
          from: getUserModelDataProvider,
          name: r'getUserModelDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserModelDataHash,
          dependencies: GetUserModelDataFamily._dependencies,
          allTransitiveDependencies:
              GetUserModelDataFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetUserModelDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<UserDataModel> Function(GetUserModelDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserModelDataProvider._internal(
        (ref) => create(ref as GetUserModelDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserDataModel> createElement() {
    return _GetUserModelDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserModelDataProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetUserModelDataRef on AutoDisposeFutureProviderRef<UserDataModel> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetUserModelDataProviderElement
    extends AutoDisposeFutureProviderElement<UserDataModel>
    with GetUserModelDataRef {
  _GetUserModelDataProviderElement(super.provider);

  @override
  String get userId => (origin as GetUserModelDataProvider).userId;
}

String _$chatNotifierHash() => r'414ec23b46bb755df5c284c41444c41c5c29d831';

/// See also [ChatNotifier].
@ProviderFor(ChatNotifier)
final chatNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ChatNotifier, void>.internal(
  ChatNotifier.new,
  name: r'chatNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
